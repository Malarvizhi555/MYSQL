CREATE TABLE Students_Non1NF (
    student_id   INT,
    student_name VARCHAR(100),
    phone_numbers VARCHAR(100)  -- e.g., '123-4567,987-6543'
);

INSERT INTO Students_Non1NF (student_id, student_name, phone_numbers)
VALUES (1, 'Alice', '123-4567,987-6543'),
       (2, 'Bob', '555-1212');


select * from Students_Non1NF
drop table if exists Students;
CREATE TABLE Students (
    student_id   INT PRIMARY KEY,
    student_name VARCHAR(100)
);

drop table if exists StudentPhones;
CREATE TABLE StudentPhones (
    student_id INT,
    phone      VARCHAR(20),
    PRIMARY KEY (student_id, phone),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_id, student_name)
VALUES (1, 'Alice'),
       (2, 'Bob');
use test
INSERT INTO StudentPhones (student_id, phone)
VALUES (1, '123-4567'),
       (1, '987-6543'),
       (2, '555-1212');
select * from  Students

select * from  Studentphones

SELECT a.student_id,
       a.student_name,
       b.phone
FROM Students a
JOIN StudentPhones b
     ON a.student_id = b.student_id;
     
CREATE TABLE Enrollment_Non2NF (
    student_id  INT,
    course_id   INT,
    course_name VARCHAR(100),
    instructor  VARCHAR(100),
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO Enrollment_Non2NF (student_id, course_id, course_name, instructor)
VALUES (1, 101, 'Intro to SQL', 'Dr. Smith'),
       (2, 101, 'Intro to SQL', 'Dr. Smith'),
       (1, 102, 'Database Design', 'Dr. Jones');
       
select * from Enrollment_Non2NF
use test
CREATE TABLE Enrollment (
    student_id INT,
    course_id  INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Courses (
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor  VARCHAR(100)
);

INSERT INTO Courses (course_id, course_name, instructor)
VALUES (101, 'Intro to SQL', 'Dr. Smith'),
       (102, 'Database Design', 'Dr. Jones');
       
INSERT INTO Enrollment (student_id, course_id)
VALUES (1, 101),
       (2, 101),
       (1, 102);
       
select * from Courses

select * from Enrollment

SELECT a.course_id,
       a.course_name,
	   b.student_id
FROM Courses a
JOIN Enrollment b
     ON a.course_id = b.course_id;
     
SELECT a.course_id,
       a.course_name,
       i.instructor,
       e.student_id
FROM Courses a
JOIN Enrollment e
     ON a.course_id = e.course_id
JOIN Instructors i
     ON a.course_id = i.course_id;



CREATE TABLE Courses_Non3NF (
    course_id        INT PRIMARY KEY,
    course_name      VARCHAR(100),
    instructor       VARCHAR(100),
    instructor_office VARCHAR(100)
);


INSERT INTO Courses_Non3NF (course_id, course_name, instructor, instructor_office)
VALUES (101, 'Intro to SQL', 'Dr. Smith', 'Room 101'),
       (102, 'Database Design', 'Dr. Jones', 'Room 102');
       
select * from Courses_Non3NF

drop table if exists Instructors6;
CREATE TABLE Instructors (
    instructor       VARCHAR(100) PRIMARY KEY,
    instructor_office VARCHAR(100)
);

INSERT INTO Instructors (instructor, instructor_office)
VALUES ('Dr. Smith', 'Room 101'),
       ('Dr. Jones', 'Room 102');


CREATE TABLE Courses (
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor  VARCHAR(100),
    FOREIGN KEY (instructor) REFERENCES Instructors(instructor)
);

INSERT INTO Courses (course_id, course_name, instructor)
VALUES (101, 'Intro to SQL', 'Dr. Smith'),
       (102, 'Database Design', 'Dr. Jones');
    
select * from Instructors

select * from Courses

use test
DROP TABLE IF EXISTS Instructors6;
CREATE TABLE Instructors6 (
    instructor       VARCHAR(100) PRIMARY KEY,
    instructor_office VARCHAR(100)
);

INSERT INTO Instructors6 (instructor, instructor_office)
VALUES ('Dr. Smith', 'Room 101');

drop table if exists Courses6;
CREATE TABLE Courses6 (
    course_id   INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor  VARCHAR(100),
    FOREIGN KEY (instructor) REFERENCES Instructors6(instructor)
);

INSERT INTO Courses6 (course_id, course_name, instructor)
VALUES (101, 'Intro to SQL', 'Dr. Smith');
    
select * from Instructors6;
select * from Courses6;
       