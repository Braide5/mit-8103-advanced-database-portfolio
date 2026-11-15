# MIT 8103 Advanced Database Systems — Portfolio Summary
## Case Study: University Student Management and Course Registration System

### Organisation and system overview
The selected case study is a simulated university student management and course registration system. The database supports students, academic departments, lecturers, courses, and semester-based registrations. Its users include registry staff, students, lecturers, and database administrators. Core operations include student record management, course registration, roster retrieval, grade recording, reporting, and maintaining data integrity.

### Portfolio 1: Database Design and Modelling
A relational schema was designed for Departments, Students, Lecturers, Courses, and Registrations. Primary keys uniquely identify records, while foreign keys establish relationships and enforce referential integrity. Unique constraints prevent duplicate matriculation numbers, emails, course codes, and repeated registrations for the same student/course/term. Check constraints restrict credit units and grade values. The design separates entities to reduce duplication and follows the principles of normalisation.

### Portfolio 2: Query Processing and Optimisation
SQL queries retrieve student department details, course rosters, registration totals, multi-course students, and semester grade reports. Indexes on registration course/term attributes and student_id are proposed to improve common filtering and join operations. EXPLAIN QUERY PLAN is included for plan inspection in SQLite; MySQL users can use EXPLAIN. Performance conclusions should be based on execution evidence captured in the selected database environment.

### Portfolio 3: Transactions and Concurrency
Transaction scripts demonstrate BEGIN, COMMIT, and ROLLBACK. The system uses uniqueness and foreign-key constraints to prevent duplicate or invalid registration records. The concurrency section describes SQLite's write serialization and busy timeout behavior. A multi-session lock demonstration should be captured if executed; scripts alone are not evidence of a completed concurrency test.

### Portfolio 4: NoSQL and Advanced Data Models
A MongoDB document model stores a student's profile with nested department and registration details. This denormalized structure supports retrieving a profile and course registrations in one document. Index examples are provided. Relational databases remain suitable for strong referential integrity and complex cross-entity queries.

### Portfolio 5: Distributed and Cloud Database Exercise
A cloud deployment design describes a primary database and read replica, replication lag, sharding by a stable key, availability, consistency, security, backups, and recovery. This is a documented design proposal rather than a live cloud deployment unless configuration evidence is separately captured.

### Technical reflection
This portfolio helped connect relational design with practical query writing, integrity constraints, indexing, transactions, and alternative data models. One design consideration is balancing normalisation with read efficiency: the relational model reduces duplication, while the MongoDB profile document intentionally embeds registration information for convenient retrieval. Query optimisation should be validated using execution plans and measurements rather than assumptions. The distributed design also highlighted that replication and sharding introduce trade-offs in consistency, operational complexity, and query routing.

### GitHub
Repository URL: [Insert your private GitHub repository URL here]

### AI Use Declaration
AI tool used: ChatGPT (OpenAI). It was used to assist with planning the portfolio structure, drafting example SQL and MongoDB scripts, explanations, and documentation. The student is responsible for reviewing, adapting, running, correcting, and verifying all code and claims, and should describe the verification actually performed. External resources and any database software/datasets used should be cited according to course requirements.
