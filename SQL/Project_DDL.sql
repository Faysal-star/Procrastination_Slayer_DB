DROP TABLE Students;
DROP TABLE Instructors;
DROP TABLE Courses;
DROP TABLE Enrollments ;
DROP TABLE Assessment ;

-- Creating the Students table
CREATE TABLE Students (
    Student_id NUMBER PRIMARY KEY,
    Full_name VARCHAR2(100),
    Email VARCHAR2(100),
    DOB DATE,
    Major VARCHAR2(100),
    Enrollment_year NUMBER
);



-- Creating the Instructors table
CREATE TABLE Instructors (
    Instructor_id NUMBER PRIMARY KEY,
    Full_name VARCHAR2(100),
    Department VARCHAR2(100),
    Email VARCHAR2(100),
    Joining_date DATE
);

-- Creating the Courses table
CREATE TABLE Courses (
    Course_Code VARCHAR2(10) PRIMARY KEY,
    Course_name VARCHAR2(100),
    Instructor_id NUMBER,
    Course_content VARCHAR2(400),
    Credit NUMBER,
    CONSTRAINT fk_instructor
        FOREIGN KEY (Instructor_id)
        REFERENCES Instructors(Instructor_id) ON DELETE CASCADE
);


-- Creating the Enrollments table
CREATE TABLE Enrollments (
    Enrollment_id NUMBER PRIMARY KEY,
    Student_id NUMBER,
    Course_code VARCHAR2(10),
    Year NUMBER,
    Term VARCHAR2(20),
    Type VARCHAR2(20),
    CONSTRAINT fk_student
        FOREIGN KEY (Student_id)
        REFERENCES Students(Student_id) ON DELETE CASCADE,
    CONSTRAINT fk_course
        FOREIGN KEY (Course_code)
        REFERENCES Courses(Course_Code) ON DELETE CASCADE
);


-- Creating the Assessment table
CREATE TABLE Assessment (
    Result_id NUMBER PRIMARY KEY,
    Enrollment_id NUMBER,
    Score NUMBER,
    GPA NUMBER,
    Comments VARCHAR2(200),
    CONSTRAINT fk_enrollment
        FOREIGN KEY (Enrollment_id)
        REFERENCES Enrollments(Enrollment_id) ON DELETE CASCADE
);



-- View the tables
SELECT * FROM Students;
SELECT * FROM Instructors;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Assessment;



-- Insert into Students
INSERT INTO Students (Student_id, Full_name, Email, DOB, Major, Enrollment_year) VALUES
(1, 'John Doe', 'john.doe@example.com', TO_DATE('1995-03-12', 'YYYY-MM-DD'), 'Computer Science', 2013);
INSERT INTO Students VALUES(2, 'Jane Smith', 'jane.smith@example.com', TO_DATE('1997-07-24', 'YYYY-MM-DD'), 'Mechanical Engineering', 2015);
INSERT INTO Students VALUES(3, 'Emily Johnson', 'emily.johnson@example.com', TO_DATE('1996-01-09', 'YYYY-MM-DD'), 'Electrical Engineering', 2014);
INSERT INTO Students VALUES(4, 'Michael Brown', 'michael.brown@example.com', TO_DATE('1998-04-16', 'YYYY-MM-DD'), 'Biology', 2016);
INSERT INTO Students VALUES(5, 'Jessica Davis', 'jessica.davis@example.com', TO_DATE('1997-11-03', 'YYYY-MM-DD'), 'Physics', 2015);
INSERT INTO Students VALUES(6, 'William Wilson', 'william.wilson@example.com', TO_DATE('1999-05-05', 'YYYY-MM-DD'), 'Chemical Engineering', 2017);
INSERT INTO Students VALUES(7, 'Olivia Martin', 'olivia.martin@example.com', TO_DATE('1996-02-15', 'YYYY-MM-DD'), 'Civil Engineering', 2014);
INSERT INTO Students VALUES(8, 'Thomas Garcia', 'thomas.garcia@example.com', TO_DATE('1998-08-26', 'YYYY-MM-DD'), 'Environmental Science', 2016);
INSERT INTO Students VALUES(9, 'Charlotte Lee', 'charlotte.lee@example.com', TO_DATE('1995-12-30', 'YYYY-MM-DD'), 'Mathematics', 2013);
INSERT INTO Students VALUES(10, 'Daniel Taylor', 'daniel.taylor@example.com', TO_DATE('1997-10-12', 'YYYY-MM-DD'), 'Statistics', 2015);


-- Insert Into Instructors
INSERT INTO Instructors (Instructor_id, Full_name, Department, Email, Joining_date) VALUES
(1, 'Dr. Alan Walker', 'Computer Science', 'alan.walker@example.com', TO_DATE('2010-02-15', 'YYYY-MM-DD'));
INSERT INTO Instructors VALUES(2, 'Dr. Sarah Connor', 'Mechanical Engineering', 'sarah.connor@example.com', TO_DATE('2008-05-10', 'YYYY-MM-DD'));
INSERT INTO Instructors VALUES(3, 'Dr. Raj Patel', 'Electrical Engineering', 'raj.patel@example.com', TO_DATE('2012-07-09', 'YYYY-MM-DD'));
INSERT INTO Instructors VALUES(4, 'Dr. Linda Taylor', 'Biology', 'linda.taylor@example.com', TO_DATE('2011-03-22', 'YYYY-MM-DD'));
INSERT INTO Instructors VALUES(5, 'Dr. James Lee', 'Physics', 'james.lee@example.com', TO_DATE('2009-11-01', 'YYYY-MM-DD'));


-- Insert Into Courses
INSERT INTO Courses (Course_Code, Course_name, Instructor_id, Course_content, Credit) VALUES
('CS101', 'Introduction to Computer Science', 1, 'Fundamentals of Computer Science', 3);
INSERT INTO Courses VALUES('ME201', 'Thermodynamics', 2, 'Introduction to Thermodynamics', 4);
INSERT INTO Courses VALUES('EE301', 'Circuit Analysis', 3, 'Basic Principles of Electrical Circuits', 3);
INSERT INTO Courses VALUES('BI401', 'Cell Biology', 4, 'Study of Cell Structure and Function', 3);
INSERT INTO Courses VALUES('PH501', 'Quantum Mechanics', 5, 'Introduction to Quantum Mechanics', 4);
INSERT INTO Courses VALUES('CS102', 'Data Structures', 1, 'Introduction to Data Structures', 3);
INSERT INTO Courses VALUES('ME202', 'Fluid Mechanics', 2, 'Fundamentals of Fluid Mechanics', 3);
INSERT INTO Courses VALUES('EE302', 'Electronics', 3, 'Solid State Devices and Circuits', 4);
INSERT INTO Courses VALUES('BI402', 'Genetics', 4, 'Principles of Genetic Inheritance', 3);
INSERT INTO Courses VALUES('PH502', 'Electromagnetism', 5, 'Theories of Electromagnetic Fields', 3);

-- Insert Into Enrollments
INSERT INTO Enrollments (Enrollment_id, Student_id, Course_code, Year, Term, Type) VALUES(1, 1, 'CS102', 2013, 'Fall', 'Full-time');
INSERT INTO Enrollments VALUES(2, 2, 'ME201', 2015, 'Spring', 'Full-time');
INSERT INTO Enrollments VALUES(3, 3, 'EE301', 2014, 'Fall', 'Full-time');
INSERT INTO Enrollments VALUES(4, 4, 'BI401', 2016, 'Spring', 'Full-time');
INSERT INTO Enrollments VALUES(5, 5, 'PH501', 2015, 'Fall', 'Full-time');
INSERT INTO Enrollments VALUES(6, 6, 'CS102', 2017, 'Spring', 'Full-time');
INSERT INTO Enrollments VALUES(7, 7, 'ME202', 2014, 'Fall', 'Full-time');
INSERT INTO Enrollments VALUES(8, 8, 'EE302', 2016, 'Spring', 'Full-time');
INSERT INTO Enrollments VALUES(9, 9, 'BI402', 2013, 'Fall', 'Full-time');
INSERT INTO Enrollments VALUES(10, 10, 'PH502', 2015, 'Spring', 'Full-time');

--Insert Into Assessments
INSERT INTO Assessment (Result_id, Enrollment_id, Score, GPA, Comments) VALUES(1, 1, 85, 3.5, 'Excellent understanding of basic concepts.');
INSERT INTO Assessment VALUES(2, 2, 78, 3.0, 'Good performance, but needs to work on practical applications.');
INSERT INTO Assessment VALUES(3, 3, 92, 4.0, 'Outstanding performance.');
INSERT INTO Assessment VALUES(4, 4, 88, 3.7, 'Very good understanding of biological systems.');
INSERT INTO Assessment VALUES(5, 5, 90, 3.8, 'Excellent analytical skills.');
INSERT INTO Assessment VALUES(6, 6, 95, 4.0, 'Exceptional problem-solving skills.');
INSERT INTO Assessment VALUES(7, 7, 80, 3.2, 'Solid understanding, but needs to improve in problem sets.');
INSERT INTO Assessment VALUES(8, 8, 85, 3.5, 'Good practical skills.');
INSERT INTO Assessment VALUES(9, 9, 75, 3.0, 'Adequate, but needs more consistent effort.');
INSERT INTO Assessment VALUES(10, 10, 82, 3.3, 'Good grasp of electromagnetic theories.');


commit;

