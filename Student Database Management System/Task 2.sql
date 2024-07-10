--Task2
--Student DBMS (PostGre SQL)

--1.Database Setup
CREATE DATABASE student_database;

CREATE TABLE student_table (    
student_id INTEGER PRIMARY KEY,    
stu_name TEXT NOT NULL,    
department TEXT,    
email_id TEXT UNIQUE NOT NULL,
phone_no NUMERIC, 
address VARCHAR(50),
date_of_birth DATE,
gender TEXT,
major TEXT,
GPA NUMERIC,
grade TEXT); 

--2.Data Entry
INSERT INTO student_table VALUES (01, 'Priyansh', 'Coumputer Science', 'sripriyc@gmail.com','8787787878','146, Prem Nagar, Lucknow','11-NOV-1998','Male','AI','8','B');
INSERT INTO student_table VALUES (02, 'Abhay', 'English', 'abhay@gmail.com','8786787877','20, Lovelane, Kanpur','19-JUN-1997','Male','Literature','6.5','D');
INSERT INTO student_table VALUES (03, 'Harshit', 'Physics', 'harshit@gmail.com','8785787876','121a, Akbarpur, Noida','12-MAY-1993','Male','Astrophysics','9','A');
INSERT INTO student_table VALUES (04, 'Anjali', 'Economics', 'anjali@gmail.com','8784787875','769, Patrakarpuram, Bangalore','23-JAN-1991','Female','Economics','7','B');
INSERT INTO student_table VALUES (05, 'Ashish', 'Computer Science', 'ashish@gmail.com','8787737874','66, Madiyaon, Chandigarh','01-JUN-1999','Male','Neural Networking','4.9','E');
INSERT INTO student_table VALUES (06, 'Aahana', 'English', 'aahana@gmail.com','8782787873','616, Tedhi Puliya, Gurugram','12-MAR-1998','Female','Literature','9.2','A');
INSERT INTO student_table VALUES (07, 'Ayush', 'Economics', 'ayush@gmail.com','8787717872','60, Suratnagar, Lucknow','11-JAN-1995','Male','Economics','9','A');
INSERT INTO student_table VALUES (08, 'Bhanu', 'Physics', 'Bhanu@gmail.com','8787717869','69, Badagaon, Sitapur','09-MAY-1995','Male','Astrophysics','6.9','D');
INSERT INTO student_table VALUES (09, 'Jaya', 'English', 'Jaya@gmail.com','8787717868','79, Hathipur, Lakhimpur','12-JUN-1995','Female','Literature','6.3','D');
INSERT INTO student_table VALUES (10, 'Amitabh', 'Computer Science', 'Amitabh@gmail.com','8787717867','89, Indira Nagar, Delhi','17-NOV-1995','Male','ML','7.2','C');

--3.Student Information Retrieval
SELECT * FROM student_table ORDER BY grade DESC; 

--4.Query for Male students
SELECT * FROM student_table WHERE gender = 'Male'; 

--5.Query for students with GPA less than 5.0
SELECT * FROM student_table WHERE GPA < 5.0; 

--6.Update Student email and grade
UPDATE student_table SET email_id = 'anjalibose@gmail.com', grade = 'C'
WHERE student_id = 04;

Select * from student_table Where student_id = 04;

--7.Query for students with grade 'B'
SELECT stu_name, date_of_birth FROM student_table WHERE grade = 'B';

--8.Grouping and Calculation
SELECT department, gender, AVG(GPA) as Average_GPA
FROM student_table
GROUP BY department, gender
ORDER by department;

--9.Table Renaming
ALTER TABLE student_table RENAME TO student_info;

--10.Retrieve Student with Highest GPA
SELECT * FROM student_info 
WHERE GPA = (SELECT MAX(GPA) FROM student_info);


