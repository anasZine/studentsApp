// models/student.dart
class std {
  final String id;
  final String firstName;
  final String lastName;
  final String university;
  final String specialization;
  final int age;

  std({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.university,
    required this.specialization,
    required this.age,
  });

  factory std.fromJson(Map<String, dynamic> json) => std(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    university: json['university'] as String,
    specialization: json['specialization'] as String,
    age: json['age'] as int,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'university': university,
    'specialization': specialization,
    'age': age,
  };
}
