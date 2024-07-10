--Task 3
--1.Database creation

--CREATE DATABASE EventsManagement;

---Create the Events table
CREATE TABLE Events( 
    Event_Id SERIAL PRIMARY KEY, 
    Event_Name VARCHAR(150) NOT NULL, 
    Event_Date Date NOT NULL, 
    Event_Location VARCHAR(255), 
    Event_Description TEXT 
);

--Create the Attendees table
CREATE TABLE Attendees( 
    Attendee_Id SERIAL PRIMARY KEY, 
    Attendee_Name VARCHAR(255) NOT NULL, 
    Attendee_Phone VARCHAR(15), 
    Attendee_Email VARCHAR(255), 
    Attendee_City VARCHAR(255)
);

--Create the Registrations table
CREATE TABLE Registrations( 
    Registration_ID SERIAL PRIMARY KEY, 
    Event_Id INT REFERENCES Events(Event_Id), 
    Attendee_Id INT REFERENCES Attendees(Attendee_Id), 
    Registration_Date DATE, 
    Registration_Amount NUMERIC(10,2)
);

--2.Data Creation
INSERT INTO Events(Event_Id,Event_Name,Event_Date,Event_Location,Event_Description) 
VALUES 
(01,'Rockstar','02-NOV-2024','Lucknow','Musical night with Ranbir Kapoor'), 
(02,'Beat with Boat','10-NOV-2024','Mumbai','Product Launch'), 
(03,'Groovestar','2-DEC-2024','Kanpur','Arijit Singh show'), 
(04,'Indian Idol','12-DEC-2024','Bangalore','Grand Finale'), 
(05,'Dance with Santa','25-DEC-2024','Chennai','Christmas Celebration');

INSERT INTO Attendees(Attendee_Id,Attendee_Name,Attendee_Phone,Attendee_Email,Attendee_City) 
VALUES 
(1069,'Priyansh','7897888890','priyansh@gmail.com','Lucknow'),
(2069,'Anjali','7897888891','anjali@gmail.com','Kanpur'),
(3069,'Harshit','7897888892','harshit@gmail.com','Delhi'),
(4069,'Ashish','7897888893','ashish@gmail.com','Chennai'),
(5069,'Divyansh','7897888894','divyansh@gmail.com','Mumbai');


INSERT INTO Registrations(Event_Id,Attendee_Id,Registration_Date,Registration_Amount) 
VALUES 
(01,1069,'10-OCT-2024',1500.00), 
(01,2069,'10-OCT-2024',1500.00), 
(03,3069,'2-NOV-2024',2700.00), 
(03,4069,'2-NOV-2024',2700.00),
(04,3069,'5-NOV-2024',1000.00), 
(04,4069,'5-NOV-2024',1000.00);

--3.Manage Event Details
--3.a
INSERT INTO Events(Event_Id,Event_Name,Event_Date,Event_Location,Event_Description) 
VALUES 
(06,'Firecracker','29-Dec-2024','Rishikesh','Firecracker show');

Select * from Events;

--3.b
UPDATE Events 
SET Event_Location = 'Chandigarh' 
WHERE Event_Id = 04;

Select * from Events;

--3.c
DELETE FROM Events 
WHERE Event_Id = 05;

Select * from Events;

--4.Manage, Track Attendees and handle events
--4.a
INSERT INTO Attendees (Attendee_Id,Attendee_Name,Attendee_Phone,Attendee_Email,Attendee_City) 
VALUES (6069,'Ayush','7878879099','ayush@gmail.com','Sitapur');

Select * from Attendees;

--4.b
INSERT INTO Registrations(Event_Id,Attendee_Id,Registration_Date,Registration_Amount) 
VALUES 
(04,6069,'05-NOV-2024',1000.00);

Select * from Registrations;

--5
SELECT * FROM Events WHERE Event_Id = 04;

SELECT COUNT(*) AS Total_number_of_events FROM Events;

SELECT * FROM Attendees;

SELECT COUNT(*) AS Number_of_attendees FROM Attendees;

SELECT * FROM Registrations WHERE Event_Id = 03;

SELECT COUNT(*) FROM Registrations;
