-- Portfolio 3: Transactions and concurrency (SQLite-compatible demonstration)
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;
INSERT INTO registrations(student_id, course_id, semester, academic_year, grade)
VALUES (1003,304,'First','2026/2027',NULL);
-- Check the inserted record before commit:
SELECT * FROM registrations WHERE student_id=1003 AND course_id=304;
COMMIT;

-- Rollback demonstration (the inserted record is not retained):
BEGIN TRANSACTION;
INSERT INTO registrations(student_id, course_id, semester, academic_year, grade)
VALUES (1005,305,'First','2026/2027',NULL);
ROLLBACK;

-- Integrity / concurrency control examples:
-- 1. UNIQUE(student_id, course_id, semester, academic_year) prevents duplicate registrations.
-- 2. Foreign keys prevent registering nonexistent students or courses.
-- 3. SQLite serializes writes; busy timeout can help competing writers:
PRAGMA busy_timeout = 5000;
-- In a multi-session test, Session A begins a write transaction and holds it;
-- Session B attempts a write. Session B waits up to the timeout, then reports
-- SQLITE_BUSY if Session A still holds the write lock. Capture actual output if tested.
