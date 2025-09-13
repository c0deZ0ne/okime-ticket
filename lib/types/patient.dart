class Patient {
  final int? id;
  final String name;
  final int age;
  final String diagnosis;

  Patient({
    this.id,
    required this.name,
    required this.age,
    required this.diagnosis,
  });

  Map<String, dynamic> toMap() {
    return {"id": id, "name": name, "age": age, "diagnosis": diagnosis};
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      diagnosis: map["diagnosis"],
    );
  }
}
