INSERT INTO departments VALUES
(1,'Computer Science','Science'),
(2,'Agricultural Technology','Agriculture'),
(3,'Information Technology','Science');

INSERT INTO students VALUES
(1001,'UNI/2024/001','Ada','Okafor','ada.okafor@example.edu',2024,1),
(1002,'UNI/2024/002','Chidi','Eze','chidi.eze@example.edu',2024,3),
(1003,'UNI/2023/003','Zainab','Bello','zainab.bello@example.edu',2023,2),
(1004,'UNI/2023/004','Tunde','Adebayo','tunde.adebayo@example.edu',2023,1),
(1005,'UNI/2024/005','Mariam','Yusuf','mariam.yusuf@example.edu',2024,2);

INSERT INTO lecturers VALUES
(201,'Grace','Nwosu','grace.nwosu@example.edu',1),
(202,'Emeka','Ibe','emeka.ibe@example.edu',2),
(203,'Sade','Ojo','sade.ojo@example.edu',3);

INSERT INTO courses VALUES
(301,'CSC401','Advanced Database Systems',3,1,201),
(302,'CSC402','Data Structures',3,1,201),
(303,'AGR310','Crop Information Systems',3,2,202),
(304,'ITC320','Cloud Computing',3,3,203),
(305,'CSC410','Distributed Systems',4,1,201);

INSERT INTO registrations(registration_id, student_id, course_id, semester, academic_year, grade) VALUES
(1,1001,301,'First','2026/2027','A'),
(2,1001,302,'First','2026/2027','B'),
(3,1002,301,'First','2026/2027','B'),
(4,1002,304,'First','2026/2027','A'),
(5,1003,303,'First','2026/2027','A'),
(6,1004,301,'First','2026/2027','C'),
(7,1004,305,'First','2026/2027','B'),
(8,1005,303,'First','2026/2027','B');
