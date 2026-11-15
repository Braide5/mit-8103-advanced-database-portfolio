-- MIT 8103 Advanced Database Systems
-- Case study: University Student Management and Course Registration System
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS registrations;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS lecturers;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS students;

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY,
    department_name TEXT NOT NULL UNIQUE,
    faculty TEXT NOT NULL
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    matric_number TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    admission_year INTEGER NOT NULL CHECK(admission_year >= 2000),
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE lecturers (
    lecturer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY,
    course_code TEXT NOT NULL UNIQUE,
    course_title TEXT NOT NULL,
    credit_units INTEGER NOT NULL CHECK(credit_units BETWEEN 1 AND 6),
    department_id INTEGER NOT NULL,
    lecturer_id INTEGER,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id)
);

CREATE TABLE registrations (
    registration_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    semester TEXT NOT NULL CHECK(semester IN ('First','Second')),
    academic_year TEXT NOT NULL,
    grade TEXT CHECK(grade IN ('A','B','C','D','E','F') OR grade IS NULL),
    registered_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(student_id, course_id, semester, academic_year),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
