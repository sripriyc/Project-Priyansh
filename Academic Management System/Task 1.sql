--Task 1
--Academic Management System (using SQL)
-----------------------------------------------------------------------------------------------------------------------------------------
--1. Database Creation 

CREATE TABLE StudentInfo (    
stu_id INT PRIMARY KEY,    
stu_name VARCHAR(255),    
DOB DATE,    
phone_no INT,    
email_id VARCHAR(255),    
address VARCHAR(255)   
);

CREATE TABLE CourseInfo (   
course_id INT PRIMARY KEY,    
course_name VARCHAR(255),  
course_instructor_name VARCHAR(255)  
);

CREATE TABLE EnrollmentInfo (    
enrollment_id INT PRIMARY KEY,    
course_id INT,    
stu_id INT,  
enroll_status VARCHAR(255),  
CONSTRAINT FK_coursenroll   
FOREIGN KEY (course_id)  
REFERENCES CourseInfo(course_id),  
CONSTRAINT FK_studentenroll   
FOREIGN KEY (stu_id)  
REFERENCES StudentInfo(stu_id)  
);

-----------------------------------------------------------------------------------------------------------------------------------------
--2. Data Creation 

INSERT INTO StudentInfo VALUES ('01', 'Priyansh Srivastava', '11-NOV-1998', '8899332210', 'sripriyc@gmail.com', '146, Prem Nagar, Lucknow');
INSERT INTO StudentInfo VALUES ('02', 'Ashish Pandey', '21-JULY-1997', '8399331219', 'ashishp@gmail.com', '20, Lovelane, Kanpur');
INSERT INTO StudentInfo VALUES ('03', 'Aahana Mishra', '20-AUGUST-1992', '8898331212', 'aahanamishra90@gmail.com', '121a, Akbarpur, Noida');
INSERT INTO StudentInfo VALUES ('04', 'Harshit Kashyap', '19-JAN-1991', '7893331213', 'harshitamazon@gmail.com', '769, Patrakarpuram, Bangalore');
INSERT INTO StudentInfo VALUES ('05', 'Anjali Bose', '17-MARCH-1995', '7089332211', 'anjalibose@gmail.com', '66, Madiyaon, Chandigarh');
INSERT INTO CourseInfo VALUES ('101','Maths','Mithelesh Yadav');
INSERT INTO CourseInfo VALUES ('102','Physics','Anuradha Kashyap');
INSERT INTO CourseInfo VALUES ('103','Chemistry','Ayush Sharma');
INSERT INTO CourseInfo VALUES ('104','English','Gauri Kapoor');
INSERT INTO CourseInfo VALUES ('105','Spanish','Tanya Nigam');


INSERT INTO EnrollmentInfo VALUES ('2001','101','02', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2002','102','02', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2003','105','02', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2004','103','01', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2005','105','03', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2006','104','03', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2007','103','04', 'Not Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2008','102','04', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2009','101','01', 'Enrolled');
INSERT INTO EnrollmentInfo VALUES ('2010','104','05', 'Not Enrolled');

-----------------------------------------------------------------------------------------------------------------------------------------
--3. Retrieve the Student Information 
--3.a
SELECT distinct stu_name, phone_no, email_id, address, enroll_status  
FROM StudentInfo stu, EnrollmentInfo en
WHERE stu.stu_id = en.stu_id;

--3.b
SELECT stu.stu_name, co.course_name, en.enroll_status 
FROM StudentInfo stu, CourseInfo co, EnrollmentInfo en 
WHERE stu.stu_id = en.stu_id 
AND co.course_id = en.course_id 
AND stu.stu_id = 02 and enroll_status = 'Enrolled';

--3.c
SELECT course_name, course_instructor_name 
FROM CourseInfo;

--3.d
SELECT course_name, course_instructor_name 
FROM CourseInfo 
WHERE course_id = 103;

--3.e
select course_name, course_instructor_name 
FROM CourseInfo 
WHERE course_id IN ('101','102','103');


-----------------------------------------------------------------------------------------------------------------------------------------
--4.Reporting and Analytics 

--a
SELECT COUNT(*) AS NumberOfStudents, course_name 
FROM EnrollmentInfo en
JOIN CourseInfo co 
ON en.course_id = co.course_id 
WHERE en.enroll_status <> 'Not Enrolled' 
GROUP BY course_name;

--b
SELECT stu.stu_name, co.course_name, en.enroll_status 
FROM StudentInfo stu, CourseInfo co, EnrollmentInfo en 
WHERE stu.stu_id = en.stu_id 
AND en.enroll_status <> 'Not Enrolled'
AND en.course_id = co.course_id  
AND co.course_id = 102;

--c
SELECT COUNT(*) AS Number_of_Enrolled_Student, course_instructor_name 
FROM EnrollmentInfo en 
JOIN CourseInfo co
ON en.course_id = co.course_id 
WHERE en.enroll_status <> 'Not Enrolled' 
GROUP BY course_instructor_name;

--d
SELECT stu.stu_name, COUNT(en.course_id) AS Number_of_courses
FROM StudentInfo stu
JOIN EnrollmentInfo en
ON stu.stu_id = en.stu_id 
WHERE en.enroll_status <> 'Not Enrolled' 
GROUP BY stu.stu_name
HAVING COUNT(*) > 1;

--e
SELECT co.course_name, COUNT(en.course_id) AS Number_of_enrolled_students
FROM CourseInfo co 
JOIN EnrollmentInfo en
ON  en.course_id = co.course_id 
WHERE en.enroll_status <> 'Not Enrolled' 
GROUP BY co.course_name 
ORDER BY Number_of_enrolled_students DESC;
----------------------------------------------------------------------------------------------------

