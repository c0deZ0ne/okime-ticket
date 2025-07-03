import 'package:flutter/material.dart';
import 'package:ticket_app/pages/material_ticket.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // use a design type Material design or Cupertino design
    //we are using MatDesign

    return MaterialApp(home: MaterialTicketPage());
  }
}
