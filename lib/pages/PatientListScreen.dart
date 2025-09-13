import 'package:flutter/material.dart';
import 'package:ticket_app/db/database_helper.dart';
import 'package:ticket_app/pages/add_patient.dart';
import 'package:ticket_app/types/patient.dart';

class PatientListScreen extends StatefulWidget {
  const PatientListScreen({super.key});

  @override
  State<PatientListScreen> createState() => _PatientStateListScreen();
}

class _PatientStateListScreen extends State<PatientListScreen> {
  List<Patient> patients = [];

  @override
  void initState() {
    super.initState();
    _loadPatients();
  }

  Future<void> _loadPatients() async {
    final data = await DBhelper.instance.fetchPatients();
    setState(() {
      patients = data.map((e) => Patient.fromMap(e)).toList();
    });
  }

  Future<void> _deletePatients(int id) async {
    await DBhelper.instance.deletePatient(id);
    _loadPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),

      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final p = patients[index];
          return ListTile(
            title: Text("${p.name} (${p.age})"),
            subtitle: Text(p.diagnosis),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPatientScreen(),
                      ),
                    );
                    _loadPatients();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    await _deletePatients(p.id!);
                    _loadPatients();
                  },
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPatientScreen()),
          );
          _loadPatients();
        },
      ),
    );
  }
}
