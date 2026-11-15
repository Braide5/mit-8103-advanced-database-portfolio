// Portfolio 4: MongoDB document model (mongosh commands)
// Collection: studentProfiles. This example denormalizes student and enrolled course
// details to make student profile/course retrieval convenient.

db.studentProfiles.insertOne({
  matricNumber: "UNI/2024/001",
  firstName: "Ada",
  lastName: "Okafor",
  email: "ada.okafor@example.edu",
  department: { departmentName: "Computer Science", faculty: "Science" },
  academicYear: "2026/2027",
  registrations: [
    { courseCode: "CSC401", courseTitle: "Advanced Database Systems", creditUnits: 3, semester: "First", grade: "A" },
    { courseCode: "CSC402", courseTitle: "Data Structures", creditUnits: 3, semester: "First", grade: "B" }
  ]
});

db.studentProfiles.find({ matricNumber: "UNI/2024/001" });
db.studentProfiles.find({ "registrations.courseCode": "CSC401" });
db.studentProfiles.createIndex({ matricNumber: 1 }, { unique: true });
db.studentProfiles.createIndex({ "registrations.courseCode": 1 });

/*
Suitability: MongoDB's flexible BSON document structure supports nested registration
records and profile retrieval in one document. It can be useful when the application
frequently fetches a student's profile and courses together. The relational SQL
database remains preferable for strict relational constraints and complex joins.
*/
