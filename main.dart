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
        }
    }
}git