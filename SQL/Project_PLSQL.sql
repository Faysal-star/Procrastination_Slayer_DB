-- Date Validation Trigger
CREATE OR REPLACE TRIGGER trg_validate_dob
BEFORE INSERT ON Students
FOR EACH ROW
BEGIN
  IF :NEW.DOB > SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20001, 'Date of birth cannot be in the future.');
  END IF;
END;

-- Test Date Validation Trigger
SELECT MAX(Student_id) FROM Students ;
INSERT INTO Students (Student_id, Full_name, Email, DOB, Major, Enrollment_year) VALUES
(11, 'John Doe', 'john.doe@example.com', TO_DATE('2025-03-12', 'YYYY-MM-DD'), 'Computer Science', 2013);



-- Use PL/SQL cursor to fetch a student from student table
SET SERVEROUTPUT ON
DECLARE
    CURSOR c_students IS SELECT Full_name FROM Students;
    v_student Students.Full_name%TYPE;
BEGIN
    OPEN c_students;
    LOOP
        FETCH c_students INTO v_student;
        EXIT WHEN c_students%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student);
    END LOOP;
    CLOSE c_students;
END;



-- Use a cursor to count the number of rows retrieved
SET SERVEROUTPUT ON
DECLARE 
    CURSOR c_courses IS SELECT * FROM Courses; 
    v_count NUMBER := 0; 
BEGIN 
    FOR v_course IN c_courses LOOP 
    v_count := v_count + 1;
END LOOP; 
    DBMS_OUTPUT.PUT_LINE('Total courses: ' || v_count);
END;

-- Array and Extend Function
SET SERVEROUTPUT ON
DECLARE
    TYPE t_numbers IS VARRAY(5) of NUMBER;
    v_numbers t_numbers:=t_numbers();
BEGIN
    FOR i IN 1..5 LOOP
        v_numbers.EXTEND();
        v_numbers(v_numbers.LAST) := i * 10;
    END LOOP;

    FOR i IN v_numbers.FIRST..v_numbers.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || v_numbers(i));
    END LOOP;
END;

-- Comment on GPA
SET SERVEROUTPUT ON
DECLARE
    cursor gpa_cursor is select * from Assessment ;
    gpa_row Assessment%rowtype ;
    
BEGIN
    open gpa_cursor ;
    fetch gpa_cursor into gpa_row;
    
    WHILE gpa_cursor%found loop
        if gpa_row.GPA > 3.5 then
            dbms_output.put_line('Score ' || gpa_row.Score || ' is Good' ) ;
        elsif gpa_row.GPA > 3 then
            dbms_output.put_line('Score ' || gpa_row.Score || ' needs to improve' ) ;
        else 
            dbms_output.put_line('Score ' || gpa_row.Score || ' is not Good' ) ;
        end if;
        fetch gpa_cursor into gpa_row;
    end loop ;
    close gpa_cursor ;
end ;