import 'package:flutter/material.dart';
import 'package:gerund/SecondPage.dart';

void main() {
  runApp(const gerund());
}

class gerund extends StatelessWidget {
  const gerund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  double height = 100;
  double weight = 100;
  double bmi = 0;
  String it = "";
  void _inc() {
    setState(() {
      weight++;
    });
  } //inc

  void _dec() {
    setState(() {
      weight--;
    });
  } //dec

  void _bnmi() {
    setState(() {
      bmi=(weight/(height*height))*10000;
      if (bmi<18)
        {it="Underweight";}
      else if(bmi>18 && bmi<25)
        {it="Normal weight";}
      else if(bmi>25 && bmi<30)
        {it="Overweight";}
      else
        {it="Obese";}

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text ("BMI Calculator",
        style: TextStyle(color: Color(0xff230000)),
        ),
      ),
      body:
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Enter your height here:",
            style: TextStyle(fontSize:40, color: Color(0xff230000)),
            textAlign: TextAlign.center,
          ),

          Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey,
              ),

            height: 150,
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Height: ${height.round()}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                      color: Color(0xff000000)
                  ),
                ),
                Slider(value: height, min:5, activeColor: Colors.lightBlue, inactiveColor: Colors.blue, max: 200, onChanged:(value) {
                  setState(() {
                    height = value;
                  });
                }
                )
              ]
            )
          ),

          Text(
            "Enter your weight here:",
            style: TextStyle(fontSize:40, color: Color(0xff230000)),
          ),

          Container(
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueGrey,
          ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Weight: ${weight}",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff000000)
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                          onPressed: () {_inc();},
                          elevation: 2.0,
                          color: Colors.blue,
                          hoverColor: Colors.green,
                          highlightColor: Colors.greenAccent,
                          child: Icon(
                            Icons.add,
                            size: 50.0,
                          ),

                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        ),
                        MaterialButton(
                          onPressed: () {_dec();},
                          elevation: 2.0,
                          color: Colors.blue,
                          hoverColor: Colors.red,
                          highlightColor: Colors.redAccent,
                          child: Icon(
                            Icons.remove,
                            size: 50.0,
                          ),

                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                        )
                      ]
                    )
                  ]
              )
          ),
          ElevatedButton(
            onPressed: () {
              _bnmi();
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(bmi:bmi, it:it)),
              ); //navigator.push
              },//onPressed
            child: Text('Calculate',
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
          Text("BMI=${bmi.round()}\nYou are in the category: ${it}",
              style: TextStyle(fontSize:40, color: Color(0xff230000)
    ),
    ),
        ]
    ),
      ]
      ),
    );
      }
}