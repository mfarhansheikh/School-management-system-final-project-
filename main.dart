import 'dart:io';


class Student {
    int id;
    String name;
    int age;
    String grade;

    Student({required this.id, required this.name, required this.age, required this.grade});

    @override 
    String toString(){
        return 'ID: $id, Name: $name, Age: $age, Grade: $grade';
    }
}

void main(){
    List<Student> students = [];
    int newId = 1;

    while (true){
        print('/n--- Student Management System ---');
        print('1. Add Student ');
        print('2. Show All Student ');
        print('3. Update Student');
        print('4. Delete Student');
        print('5. Exit');
        print('choose an option:');
        String? choise = stdin.readLineSync();

        switch(choise){
            case '1':
            //Add Student 
            print('Name:');
            String name = stdin.readLineSync()?? '';
            print('Age:');
            int age = int.parse(stdin.readLineSync()?? '0');
            print('Grade:');
            String grade = stdin.readLineSync()?? '';
            students.add(Student(id: newId++, name: name, age: age, grade: grade));
            print('Student added successfully!');
            break;

           case '2':
        // Show Students
        if (students.isEmpty) {
          print('No students found.');
        } else {
          for (var student in students) {
            print(student);
          }
        }
            break;
            case '3':
        // Update Student
        print('Enter Student ID to update: ');
        int id = int.parse(stdin.readLineSync() ?? '0');
        var student = students.firstWhere((s) => s.id == id, orElse: () => Student(id: 0, name: '', age: 0, grade: ''));
        if (student.id == 0) {
          print('Student not found!');
        } else {
          print('New Name (${student.name}): ');
          String name = stdin.readLineSync() ?? student.name;
          print('New Age (${student.age}): ');
          int age = int.parse(stdin.readLineSync() ?? student.age.toString());
          print('New Grade (${student.grade}): ');
          String grade = stdin.readLineSync() ?? student.grade;
          student.name = name.isNotEmpty ? name : student.name;
          student.age = age;
          student.grade = grade.isNotEmpty ? grade : student.grade;
          print('Student updated successfully!');
        }
        break;

         case '4':
        // Delete Student
        print('Enter Student ID to delete: ');
        int id = int.parse(stdin.readLineSync() ?? '0');
        students.removeWhere((s) => s.id == id);
        print('Student deleted successfully (if ID existed).');
        break;
      case '5':
        print('Exiting...');
        return;
      default:
        print('Invalid option. Try again.');
        }
    }
}