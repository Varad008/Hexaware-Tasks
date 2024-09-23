CREATE DATABASE Student_Information_System;
USE Student_Information_System;
SET SQL_SAFE_UPDATES = 0;



-- Student table
CREATE TABLE Students(
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    date_of_birth DATE,
    email VARCHAR(50),
    phone_number VARCHAR(11)
);

ALTER TABLE Students AUTO_INCREMENT = 101;



-- ======================================================================================


-- Enrollments table

CREATE TABLE Enrollments(
enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
FOREIGN KEY (course_id) REFERENCES Courses(course_id),
enrollment_date DATE
);


-- ======================================================================================


-- Couses table

CREATE TABLE Courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(30),
credits INT NOT NULL,
teacher_id INT,
FOREIGN KEY(teacher_id) REFERENCES Teachers(teacher_id)
);


-- ======================================================================================


-- Teacher table

CREATE TABLE Teachers(
teacher_id INT PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(30)
);


-- ======================================================================================


-- Payments table

CREATE TABLE Payments(
payment_id INT PRIMARY KEY,
student_id INT,
FOREIGN KEY (student_id) REFERENCES Students(student_id),
amount INT NOT NULL,
payment_date VARCHAR(20)
);


-- ======================================================================================



-- SAMPLE DATA


-- SAMPLE STUDENT DATA

INSERT INTO Students(first_name, last_name, date_of_birth, email, phone_number)
VALUES
("John", "Wick", '1978-08-01', "johwick@mail.com", "7847135452"),
("Harry", "Potter", '1991-01-01', "harrypotter@mail.com", "3415906382"),
("William", "Dafoe", '1969-05-01', "williamdafoe@mail.com", "2147531209"),
("Roronoa", "Zoro", '1969-08-08', "roronoazoro@mail.com", "4325099078"),
("Mulan", "Fa", '1975-03-26', "mulanfa@mail.com", "2497977790"),
("Riley", "Anderson", '1999-11-03', "rileyanderson@mail.com", "4204082211"),
("Nico", "Robin", '1982-09-14', "nicorobin@mail.com", "7847135790"),
("Natalie", "Portman", '1981-06-09', "natalieportman@mail.com", "7847135468"),
("Tyler", "Durden", '1979-04-08', "tylerdurden@mail.com", "7847139756"),
("Emily", "Rose", '1978-04-23', "johwick@mail.com", "7847132355");


-- ======================================================================================


-- SAMPLE TEACHERS DATA

INSERT INTO Teachers
VALUES
(193,"Walter","White","walterwhite@mail.com"),-- alchemy
(191,"Severus", "Snape", "severussnape@mail.com"),-- dark arts
(188, "Gandal", "The Grey", "gandalthegrey@mail.com"),-- defense magic
(183,"Professor", "Xian", "professorxian@mail.com"), --  strategy and warfare
(177,"Arwen", "Evenstar", "arwenevenstar@mail.com"),-- healing potions
(199, "Miyamoto", "Musashi", "miyamotomusashi@mail.com"),-- fighting 
(169, "Xiao", "Po", "xiaopo@mail.com"), -- martial arts
(144, "Kenshin", "Himura", "kenshinhimura@mail.com"),-- sword fighting
(133, "Ras", "al Ghul", "ra'salghul@mail.com"),-- mental discipline
(130, "QuiGon", "Jinn", "quigonjinn@mail.com");-- meditation



-- ======================================================================================


-- SAMPLE COURSES DATA

INSERT INTO Courses
VALUES
(11,"Alchemy", 35, 193),
(17, "Defence Magic", 40, 188),
(14, "Fighting", 50, 199),
(12, "Strategy and Warfare", 36, 183),
(19, "Martial Arts", 28, 169),
(22, "Sword Fighting", 60, 144),
(21, "Mental Discipline", 105, 133),
(09, "Meditation", 80, 130),
(15, "Dark Arts", 66, 191),
(33, "Healing Potions", 40, 177);


-- ======================================================================================


-- SAMPLE ENROLLMENTS DATA

INSERT INTO Enrollments
VALUES
(1, 101, 22, '1996-03-04'),
(2, 103, 12, '1996-03-12'),
(3, 105, 19, '1996-03-14'),
(4, 106, 33, '1996-03-01'),
(5, 107, 17, '1996-03-05'),
(6, 102, 15, '1996-03-06'),
(7, 104, 09, '1996-03-07'),
(8, 109, 14, '1996-03-19'),
(13, 110, 21, '1996-03-22'),
(10, 108, 11, '1996-03-27');


-- ======================================================================================


-- SAMPLE PAYMENTS DATA

INSERT INTO Payments
VALUES
(201,101,20000,'1996-04-04'),
(202,108,33000,'1996-04-04'),
(203,105,23000,'1996-04-04'),
(204,107,55000,'1996-04-04'),
(205,102,66000,'1996-04-04'),
(206,106,12000,'1996-04-04'),
(207,103,19000,'1996-04-04'),
(208,109,22000,'1996-04-04'),
(209,110,70000,'1996-04-04'),
(210,104,13000,'1996-04-04');


-- ======================================================================================

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Teachers;
SELECT * FROM Enrollments;
SELECT * FROM Payments;

-- ======================================================================================

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('Bing', 'Bong', '2001-06-05', 'bingbong@example.com', '3297597205');

INSERT INTO Enrollments
VALUES (12,113,null,'2024-11-12');

DELETE FROM Enrollments
WHERE student_id=113;



-- ======================================================================================


-- TASKS 

-- TASK 2.1

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '2000-01-01', 'john.doe@example.com', '1234567890');

-- TASK 2.2

INSERT INTO Enrollments
VALUES (11,112,17,'1996-12-04');

-- TASK 2.3

UPDATE Teachers
SET email = "ras_alghul@mail.com"
WHERE teacher_id=133;


-- TASKS 2.4

DELETE FROM Enrollments
WHERE student_id=112 AND course_id=17;


-- TASK 2.5

UPDATE Courses
SET teacher_id=191
 WHERE course_id=17;
 
 
--  TASK 2.6

DELETE FROM Students
WHERE student_id=112;


-- TASK 2.7

UPDATE Payments
SET amount=30000
WHERE payment_id=208;

-- ======================================================================================


-- TASK 3

-- TASK 3.1

SELECT Students.student_id, Students.first_name, Students.last_name, SUM(Payments.amount) AS total_payments
FROM Students 
JOIN Payments  ON Students.student_id = Payments.student_id
GROUP BY Students.student_id, Students.first_name,Students.last_name;


-- TASK 3.2

SELECT Courses.course_id, Enrollments.enrollment_id, Courses.course_name, COUNT(Enrollments.enrollment_id) AS total_students_enrolled
FROM Courses
JOIN Enrollments ON Courses.course_id=Enrollments.course_id
GROUP BY Courses.course_id,Courses.course_name, Enrollments.enrollment_id;



-- TASK 3.3

SELECT S.student_id, S.first_name, S.last_name, E.enrollment_id AS students_not_enrolled
FROM Students as S
LEFT JOIN Enrollments as E ON S.student_id=E.student_id
WHERE E.student_id is null
GROUP BY S.student_id, S.first_name, S.last_name,E.enrollment_id;


-- TASK 3.4

SELECT S.first_name, S.last_name,C.course_name AS course_enrolled
FROM Students as S
JOIN Enrollments as E ON S.student_id=E.student_id
JOIN Courses as C ON C.course_id=E.course_id
GROUP BY S.first_name, S.last_name, C.course_name;


-- TASK 3.5

SELECT T.first_name, T.last_name, C.course_name AS course_assigned
FROM Teachers as T 
JOIN Courses as C ON T.teacher_id=C.teacher_id;


-- TASK 3.6

SELECT S.first_name, S.last_name,E.enrollment_date 
FROM Students as S
JOIN Enrollments as E ON S.student_id = E.student_id
JOIN Courses as C ON E.course_id = C.course_id
WHERE course_name="Alchemy" OR course_name="Sword Fighting";


-- TASK 3.7

SELECT S.first_name, S.last_name, P.amount as Payments_made
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;



-- TASK 3.8

SELECT C.course_name, E.course_id as Enrolled_course
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;




-- TAKS 3.9

SELECT E.student_id
FROM Enrollments as E
GROUP BY E.student_id
HAVING COUNT(E.course_id) > 1;



-- TASK 3.10

SELECT T.teacher_id, T.first_name, T.last_name, C.course_id as Course_assigned
FROM Teachers as T
LEFT JOIN Courses as C on T.teacher_id = C.teacher_id;



-- ======================================================================================


-- TASK 4



-- TAKS 4.1

SELECT C.course_id, c.course_name , AVG(Enrollments) as Average
FROM Courses C
JOIN (SELECT course_id, count(student_id) as Enrollments
	   FROM Enrollments 
	   GROUP BY course_id) 
e on C.course_id = e.course_id
GROUP BY C.course_id, C.course_name;


-- TAKS 4.2
SELECT S.student_id, S.first_name, S.last_name,P.amount
FROM Students as S
JOIN Payments as P USING(student_id)
WHERE P.amount = (SELECT MAX(amount) as payment
				  FROM Payments );



-- TAKS 4.3

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrollment_count
FROM Courses as C
LEFT JOIN 
Enrollments as E ON C.course_id = E.course_id
GROUP BY C.course_id,C.course_name
HAVING COUNT(E.student_id) = (SELECT MAX(enrollment_count)
                           FROM (SELECT COUNT(student_id) AS enrollment_count
                                 FROM enrollments
                                 GROUP BY course_id) AS subquery);



-- TASK 4.4

SELECT T.teacher_id, T.first_name,T.last_name,
    (SELECT SUM(p.amount)
     FROM Payments as P
     JOIN Courses as C ON C.course_id = C.course_id
     WHERE C.teacher_id = T.teacher_id) AS total
FROM Teachers as T;



-- TASK 4.5

SELECT S.student_id,S.first_name
FROM Students as S
WHERE 
    (SELECT COUNT(*) FROM Enrollments as E WHERE E.student_id = S.student_id) = 
    (SELECT COUNT(*) FROM Courses);
    
    

-- TASK 4.6

SELECT T.teacher_id, T.first_name
FROM Teachers as T
WHERE T.teacher_id NOT IN (SELECT C.Teacher_id FROM Courses as C);



-- TASK 4.7

SELECT AVG(age) AS average_age
FROM (
    SELECT TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age
    FROM Students
) AS subquery;



-- TASK 4.8


SELECT *
FROM Courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM Enrollments
);



-- TASK 4.9

SELECT E.student_id, E.course_id,
    (SELECT SUM(P.amount) 
     FROM Payments as P 
     WHERE P.student_id = E.student_id) AS total
FROM Enrollments as E
GROUP BY E.student_id, E.course_id;



-- 4.10

SELECT student_id
FROM (
    SELECT student_id, COUNT(*) AS payment_count
    FROM payments
    GROUP BY student_id
) AS payment_counts
WHERE payment_count > 1;



-- 4.11

SELECT S.student_id, S.first_name,S.last_name  ,
SUM(P.amount) AS total
FROM Students as S
LEFT JOIN Payments as P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name;

-- 4.12

SELECT C.course_name,  COUNT(E.student_id) AS student_count
FROM Courses as C
LEFT JOIN Enrollments as E ON C.course_id = E.course_id
GROUP BY C.course_name;

-- 4.13

SELECT S.student_id, S.first_name,  AVG(P.amount) AS average
FROM Students as S
LEFT JOIN Payments as P ON S.student_id = P.student_id
GROUP BY S.student_id,  S.first_name;
