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