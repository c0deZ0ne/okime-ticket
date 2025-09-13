import 'package:flutter/material.dart';
import '../db/database_helper.dart';
import "../types/patient.dart";

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});
  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final _fromKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final diagnosisController = TextEditingController();

  void _handleSave() async {
    if (_fromKey.currentState!.validate()) {
      final patient = Patient(
        name: nameController.text,
        age: int.parse(ageController.text),
        diagnosis: diagnosisController.text,
      );
      await DBhelper.instance.insertPatient(patient.toMap());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Patient")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _fromKey,

          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextFormField(
                controller: ageController,
                decoration: const InputDecoration(labelText: "Age"),
              ),
              TextFormField(
                controller: diagnosisController,
                decoration: const InputDecoration(labelText: "Diagnosis"),
              ),

              const SizedBox(height: 20),
              ElevatedButton(onPressed: _handleSave, child: const Text("Save")),
            ],
          ),
        ),
      ),
    );
  }
}
