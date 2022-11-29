import 'package:flutter/material.dart';
import 'package:gerund/SecondPage.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() {
  runApp(const gerund());
}

class gerund extends StatelessWidget {
  const gerund({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => SecondPage(),
      },
      // home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double height = 125;
  double weight = 100;
  double bmi = 0;
  String it = "";
  bool _statush = false;
  bool _statusw = false;
  bool flagh = false;
  bool flagw = false;
  String h='';

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
      bmi = (weight / (height * height)) * 10000;
      if (bmi < 18) {
        it = "Underweight";
      } else if (bmi > 18 && bmi < 25) {
        it = "Normal weight";
      } else if (bmi > 25 && bmi < 30) {
        it = "Overweight";
      } else {
        it = "Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body:
      Center(
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                        Container(
                            child:
                                Column(
                                    children: [
                                      Text("Enter your height:",
                                        style: TextStyle(fontSize: 40, color: Color(0xff230000)),
                                        textAlign: TextAlign.center,)
                                ])
                            ),
                        Container(
                          child: FlutterSwitch(
                            width: 70.0,
                            height: 40.0,
                            valueFontSize: 20.0,
                            toggleSize: 20.0,
                            activeText: "ft",
                            inactiveText: "cm",
                            activeTextColor: Color(0xff230000),
                            inactiveTextColor: Color(0xff230000),
                            activeColor: Colors.blue,
                            inactiveColor: Colors.blueGrey,
                            activeToggleColor: Colors.blueGrey,
                            inactiveToggleColor: Colors.blue,
                            value: _statush,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                flagh=!flagh;
                                _statush=val;
                              },
                              );
                            },
                          ),
                        ),


                ],
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
                      if (flagh==true)...[
                        Text("${(height.round()/30.48).toStringAsFixed(2)} ft",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff000000))),
                      ] else...[
                        Text("${height.round()} cm",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff000000))),
                      ],


                      Slider(
                          value: height,
                          min: 50,
                          activeColor: Colors.lightBlue,
                          inactiveColor: Colors.blue,
                          max: 200,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          })
                    ]),
              ), //height, slider, container
              Container(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Enter your weight here:",
                        style: TextStyle(fontSize: 40, color: Color(0xff230000)),
                        textAlign: TextAlign.center,),
                    ],
                  )
              ),

              Container(
                child: FlutterSwitch(
                  width: 70.0,
                  height: 40.0,
                  valueFontSize: 20.0,
                  toggleSize: 20.0,
                  activeText: "lbs",
                  inactiveText: "kg",
                  activeTextColor: Color(0xff230000),
                  inactiveTextColor: Color(0xff230000),
                  activeColor: Colors.blue,
                  inactiveColor: Colors.blueGrey,
                  activeToggleColor: Colors.blueGrey,
                  inactiveToggleColor: Colors.blue,
                  value: _statusw,
                  borderRadius: 30.0,
                  padding: 8.0,
                  showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      flagw=!flagw;
                      _statusw=val;
                    },
                    );
                  },
                ),
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
                      if (flagw==true)...[
                        Text("${(weight.round()*2.205).toStringAsFixed(2)} lbs",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff000000))),
                      ] else...[
                        Text("${weight.round()} kg",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff000000))),
                      ],
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                _inc();
                              },
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
                              onPressed: () {
                                _dec();
                              },
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
                          ])
                    ]),
              ),
              Container(
                child:
                ElevatedButton(
                  onPressed: () {
                    _bnmi();
                    Navigator.pushNamed(context, '/second',
                        arguments: Argument(bmi: bmi, it: it));
                  }, //onPressed
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // <-- Radius
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );

  }
}