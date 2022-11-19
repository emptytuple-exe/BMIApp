import 'package:flutter/material.dart';
//import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Argument {
  final double bmi;
  final String it;
  Argument({required this.bmi, required this.it});
}

class SecondPage extends StatefulWidget {

  SecondPage();
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final args= ModalRoute.of(context)!.settings.arguments as Argument;
    return Scaffold(
      appBar: AppBar(
        title: Text("Result",
        style: TextStyle(color: Colors.black,
        ),
      ),
      ),
      body:
        Center(
          child:
            Column(
              children: [
                Text("BMI=${args.bmi.round()}\nYou are in the category: ${args.it}",
                    style: TextStyle(fontSize:40, color: Color(0xff230000),
                    ),
                    textAlign: TextAlign.center
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },//onPressed
                  child: Text('Re-calculate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff000000),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // <-- Radius
                    ),
                  ),
                ),

              ] // column-children
            )
            )
        );
  } // widget
} //class