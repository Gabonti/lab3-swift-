import Foundation

// Student structure
struct Student {
    var firstName: String
    var lastName: String
    var averageGrade: Double
}

// Student Journal
struct StudentJournal {
    var students: [Student] = []

    // Method to add a new student to the journal
    mutating func addStudent(student: Student) {
        students.append(student)
    }

    // Method to remove a student from the journal by first and last name
    mutating func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }

    // Method to display information about all students in the journal
    func displayStudentsInfo() {
        for student in students {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }

    // Method to list students in descending order of their GPA
    func listStudentsByDescendingGPA() -> [Student] {
        return students.sorted { $0.averageGrade > $1.averageGrade }
    }

    // Method to find the average score of all students in the journal
    func findAverageScore() -> Double {
        let totalGrades = students.reduce(0) { $0 + $1.averageGrade }
        return totalGrades / Double(students.count)
    }

    // Method to find the student with the highest GPA
    func findStudentWithHighestGPA() -> Student? {
        return students.max { $0.averageGrade < $1.averageGrade }
    }
}

// Example usage:

// Creating a student journal
var journal = StudentJournal()

// Adding students to the journal
journal.addStudent(student: Student(firstName: "John", lastName: "Doe", averageGrade: 90.5))
journal.addStudent(student: Student(firstName: "Jane", lastName: "Smith", averageGrade: 85.2))
journal.addStudent(student: Student(firstName: "Bob", lastName: "Johnson", averageGrade: 92.3))

// Displaying all students' information
journal.displayStudentsInfo()

// Removing a student from the journal
journal.removeStudent(firstName: "John", lastName: "Doe")

// Displaying all students' information after removal
journal.displayStudentsInfo()

// Listing students in descending order of their GPA
let sortedStudents = journal.listStudentsByDescendingGPA()
print("Students in descending order of GPA:")
sortedStudents.forEach { print("\($0.firstName) \($0.lastName), GPA: \($0.averageGrade)") }

// Finding the average score of all students
let averageScore = journal.findAverageScore()
print("Average score of all students: \(averageScore)")

// Finding the student with the highest GPA
if let highestGPAStudent = journal.findStudentWithHighestGPA() {
    print("Student with the highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
}
