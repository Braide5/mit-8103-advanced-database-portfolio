-- Q1: List students with their department
SELECT s.matric_number, s.first_name, s.last_name, d.department_name
FROM students s JOIN departments d ON s.department_id=d.department_id
ORDER BY s.last_name;

-- Q2: Course roster
SELECT c.course_code, c.course_title, s.matric_number, s.first_name, s.last_name
FROM registrations r JOIN students s ON r.student_id=s.student_id
JOIN courses c ON r.course_id=c.course_id
WHERE c.course_code='CSC401' AND r.semester='First' AND r.academic_year='2026/2027';

-- Q3: Registration counts by course
SELECT c.course_code, c.course_title, COUNT(r.registration_id) AS registered_students
FROM courses c LEFT JOIN registrations r ON c.course_id=r.course_id
GROUP BY c.course_id ORDER BY registered_students DESC;

-- Q4: Students taking more than one course
SELECT s.matric_number, s.first_name, s.last_name, COUNT(*) AS course_count
FROM students s JOIN registrations r ON s.student_id=r.student_id
GROUP BY s.student_id HAVING COUNT(*) > 1;

-- Q5: Grade report for a semester
SELECT s.matric_number, c.course_code, c.credit_units, r.grade
FROM registrations r JOIN students s ON r.student_id=s.student_id
JOIN courses c ON r.course_id=c.course_id
WHERE r.semester='First' AND r.academic_year='2026/2027'
ORDER BY s.matric_number, c.course_code;

-- Optimization: index supports filtering registrations by course/semester/year
CREATE INDEX IF NOT EXISTS idx_reg_course_term
ON registrations(course_id, semester, academic_year);

-- Index supports student registration lookup
CREATE INDEX IF NOT EXISTS idx_reg_student
ON registrations(student_id);

-- Examine query plan (SQLite syntax; MySQL equivalent: EXPLAIN SELECT ...)
EXPLAIN QUERY PLAN
SELECT student_id, grade FROM registrations
WHERE course_id=301 AND semester='First' AND academic_year='2026/2027';
