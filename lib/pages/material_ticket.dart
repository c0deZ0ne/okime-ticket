import 'dart:math';

import 'package:flutter/material.dart';

// class MaterialTicketPage extends StatelessWidget {
//   const MaterialTicketPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double result = 0;
//     final TextEditingController currencyInputController =
//         TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         elevation: 0,

//         title: Text(
//           "Currency Converter",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       backgroundColor: Colors.blueGrey,

//       body: Padding(
//         padding: const EdgeInsets.all(18.0),

//         // color: Colors.amber,
//         child: Center(
//           child: Column(
//             spacing: 15.6,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 result.toString(),
//                 style: TextStyle(
//                   fontSize: 44,
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextField(
//                 controller: currencyInputController,
//                 // keyboardType: TextInputType.number,
//                 style: TextStyle(color: Colors.black, height: 0),
//                 decoration: InputDecoration(
//                   hintText: "Enter currency in USD",
//                   hintStyle: TextStyle(color: Colors.black),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     // borderSide: BorderSide(color: Colors.white54, width: 1.0),
//                   ),
//                   fillColor: Colors.white,
//                   filled: true,
//                   prefixIcon: Icon(
//                     Icons.monetization_on_outlined,
//                     color: Colors.black,
//                   ),

//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                     borderSide: BorderSide(color: Colors.black87, width: 1),
//                   ),
//                 ),
//               ),

//               // ElevatedButton(
//               //   style: (ButtonStyle(
//               //     shape: WidgetStatePropertyAll(
//               //       RoundedRectangleBorder(
//               //         borderRadius: BorderRadius.circular(10),
//               //       ),
//               //     ),
//               //     elevation: const WidgetStatePropertyAll(16),
//               //     backgroundColor: const WidgetStatePropertyAll(Colors.black),
//               //     foregroundColor: const WidgetStatePropertyAll(Colors.white),
//               //     minimumSize: const WidgetStatePropertyAll(
//               //       Size(double.infinity, 45),
//               //     ),
//               //   )),
//               //   onPressed: () {
//               //     debugPrint(">>>>>>>>.Click btn>>>>>>>>>>>>>>");
//               //   },

//               //   child: const Text("Convert", style: TextStyle(fontSize: 20)),
//               // ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   elevation: 15,
//                   foregroundColor: Colors.white,
//                   minimumSize: const Size(double.infinity, 45),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadiusGeometry.circular(10),
//                   ),
//                 ),

//                 // style: (ButtonStyle(

//                 //   shape: WidgetStatePropertyAll(

//                 //     RoundedRectangleBorder(
//                 //       borderRadius: BorderRadius.circular(10),
//                 //     ),
//                 //   ),
//                 //   elevation: const WidgetStatePropertyAll(16),
//                 //   backgroundColor: const WidgetStatePropertyAll(Colors.black),
//                 //   foregroundColor: const WidgetStatePropertyAll(Colors.white),
//                 //   minimumSize: const WidgetStatePropertyAll(
//                 //     Size(double.infinity, 45),
//                 //   ),
//                 // )),
//                 onPressed: () {
//                   double.parse(currencyInputController.text) * 8;
//                 },

//                 child: const Text("Convert", style: TextStyle(fontSize: 20)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class MaterialTicketPage extends StatefulWidget {
  MaterialTicketPage({super.key}) {
    debugPrint("constructor");
  }

  @override
  State<MaterialTicketPage> createState() {
    // debugPrint("stag");
    return _MaterialTicketState();
  }
}

class _MaterialTicketState extends State<MaterialTicketPage> {
  double result = 0;
  void convertCurrency() {
    setState(() {
      if (currencyInputController.text.isNotEmpty) {
        result = (double.tryParse(currencyInputController.text) ?? 0) * 1599;
      } else {
        result = 0; // Reset result if input is empty
      }
    });
  }

  final TextEditingController currencyInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //remove debugger label
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,

        title: Text(
          "Currency Converter",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // color: Colors.amber,
        child: Center(
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: currencyInputController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black, height: 0),
                decoration: InputDecoration(
                  hintText: "Enter currency in USD",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.monetization_on_outlined,
                    color: Colors.black,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.black87, width: 1),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 15,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),

                onPressed: convertCurrency,

                child: const Text("Convert", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    //called when the widget is inserted into the widget tree
    // this is a good place to initialize state variables, controllers, etc.
    // TODO: implement initState

    // here you can initialize any state variables or controllers
    // make api call future calls, etc.

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // this is called after initState and whenever the widget's dependencies change
    //called when the widget's dependencies change
    // this is a good place to update state variables based on changes in dependencies
    // for example, if you are using an inherited widget, you can update the state here
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MaterialTicketPage oldWidget) {
    //called when the widget is updated
    // this is a good place to update state variables based on changes in the widget
    // for example, if you are using a stateful widget, you can update the state here
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    //called when the widget is removed from the widget tree
    // this is a good place to clean up resources
    // dispose the controller to avoid memory leaks
    //unsubscribe from streams, etc.
    
    currencyInputController.dispose();
    super.dispose();
  }
}
