-- Drop Table
DROP TABLE Assessment;

-- Add Column
ALTER TABLE Students ADD Phone_Number VARCHAR2(15);

-- Rename Column
ALTER TABLE Students RENAME COLUMN DOB TO Date_of_Birth;

-- Modify Column Definition
ALTER TABLE Instructors MODIFY Email VARCHAR2(150);

-- Drop Column
ALTER TABLE Courses DROP COLUMN Course_content;

-- Update Data
UPDATE Students SET Major = 'Computer Science' WHERE Full_name = 'John Doe';



-- The Number of Students enrolled in each course
SELECT c.Course_name, COUNT(e.Student_id) AS Student_Count
FROM Courses c
JOIN Enrollments e ON c.Course_Code = e.Course_code
GROUP BY c.Course_name;

-- The Latest Enrolled Student
SELECT s.Full_name, s.Major
FROM Students s
WHERE s.Enrollment_year = (SELECT MAX(Enrollment_year) FROM Students);

-- Maximum and Minimum GPA
SELECT MAX(GPA) AS HighestGPA, MIN(GPA) AS LowestGPA
FROM Assessment;

-- Display all courses offered by the Computer Science department
SELECT Course_Code, Course_name FROM Courses 
WHERE Instructor_id IN 
(SELECT Instructor_id FROM Instructors WHERE Department = 'Computer Science');

-- Emails of all students enrolled in 2015
SELECT Email FROM Students 
WHERE Student_id IN (SELECT Student_id FROM Enrollments WHERE Year = 2015);

-- Comments from assessments with a GPA lower than 3.5
SELECT GPA , Comments FROM Assessment WHERE GPA < 3.5;

-- Find all students whose names start with 'J'
SELECT Full_name FROM Students WHERE Full_name LIKE 'J%';

-- How many students are there in each major?
SELECT Major, COUNT(*) AS NumberOfStudents FROM Students GROUP BY Major;

-- Who is the youngest instructor and when did they join?
SELECT Full_name , Joining_date AS NewestJoinDate FROM Instructors
WHERE Joining_date IN (SELECT MAX(Joining_date) FROM Instructors);

-- How many students have enrolled in the past 10 years?
SELECT COUNT(*) AS RecentEnrollments FROM Students 
WHERE Enrollment_year >= EXTRACT(YEAR FROM SYSDATE) - 10;

-- Find all instructors who do not teach 'Computer Science'
SELECT i.Full_name, i.Department 
FROM Instructors i JOIN Courses c ON i.Instructor_id = c.Instructor_id 
WHERE NOT c.Course_name LIKE '%Computer Science%';

-- Are all email addresses in the Students table unique?
SELECT CASE WHEN COUNT(Email) = COUNT(DISTINCT Email)
THEN 'Yes' ELSE 'No' END AS Are_Emails_Unique FROM Students;


-- Show assessment results for a specific student
SELECT c.Course_name, a.Score, a.GPA, a.Comments
FROM Assessment a
JOIN Enrollments e ON a.Enrollment_id = e.Enrollment_id
JOIN Students s ON e.Student_id = s.Student_id
JOIN Courses c ON e.Course_code = c.Course_Code
WHERE s.Full_name = 'John Doe';

-- Average GPA in each course
WITH AverageGPA AS (
    SELECT c.Course_name, AVG(a.GPA) AS Avg_GPA
    FROM Assessment a
    JOIN Enrollments e ON a.Enrollment_id = e.Enrollment_id
    JOIN Courses c ON e.Course_code = c.Course_Code
    GROUP BY c.Course_name
)
SELECT Course_name, Avg_GPA FROM AverageGPA;

-- List all course with more than 1 student
SELECT c.Course_name, COUNT(e.Student_id) AS NumberOfStudents
FROM Courses c
JOIN Enrollments e ON c.Course_Code = e.Course_code
GROUP BY c.Course_name
HAVING COUNT(e.Student_id) > 1;

-- List student major Biology or Physics
SELECT Full_name, Major
FROM Students
WHERE Major = 'Biology' OR Major = 'Physics';

