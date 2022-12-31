import 'calculator_brain.dart';
import 'results_page.dart';
import 'package:flutter/material.dart';
import 'reuse.dart';
import 'gender.dart';

const inactivecard = Colors.blueAccent;
const activecard = Colors.lightBlueAccent;

enum Gendertype { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),
      ),
      // routes: {
      //   '/': (context) => ResultPage(),
      // },
      home: const Display(),
    );
  }
}

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int _value = 0;
  int weight = 0;
  int age = 0;

  Color malecardcolor = inactivecard;
  Color femalecardcolor = inactivecard;

  void update(Gendertype gendervalue) {
    if (gendervalue == Gendertype.male) {
      if (malecardcolor == inactivecard) {
        malecardcolor = activecard;
        femalecardcolor = inactivecard;
      } else {
        malecardcolor = inactivecard;
      }
    }
    if (gendervalue == Gendertype.female) {
      if (femalecardcolor == inactivecard) {
        femalecardcolor = activecard;
        malecardcolor = inactivecard;
      } else {
        femalecardcolor = inactivecard;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        update(Gendertype.male);
                      });
                    },
                    child: Reuse(
                      colour: malecardcolor,
                      cardchild: const Gender(
                        icon: Icons.male,
                        text: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        update(Gendertype.female);
                      });
                    },
                    child: Reuse(
                      colour: femalecardcolor,
                      cardchild: const Gender(
                        icon: Icons.female,
                        text: "Female",
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Reuse(
              colour: Colors.blue,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Height",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _value.toString(),
                        style: const TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                      const Text("cm"),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 220,
                    activeColor: Colors.black,
                    inactiveColor: Colors.white,
                    value: _value.toDouble(),
                    // label: "_value",
                    // thumbColor: Colors.red,
                    onChanged: (double value) {
                      setState(() {
                        _value = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Reuse(
                    colour: Colors.blue,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "$weight",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                                // Add your onPressed code here!
                              },
                              child: const Icon(Icons.add),
                            ),
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  weight -= 1;
                                });
                                // Add your onPressed code here!
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuse(
                    colour: Colors.blue,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "$age",
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  age += 1;
                                });
                                // Add your onPressed code here!
                              },
                              child: const Icon(Icons.add),
                            ),
                            FloatingActionButton.small(
                              onPressed: () {
                                setState(() {
                                  age -= 1;
                                });
                                // Add your onPressed code here!
                              },
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain cal =
                  CalculatorBrain(height: _value, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmistatus: cal.getResult(),
                    bmivalue: cal.calculatorBMI(),
                    description: cal.description(),
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              margin: const EdgeInsets.only(top: 10),
              height: 80,
              width: 400,
              child: const Center(
                child: Text(
                  "Calculate",
                  style: TextStyle(fontSize: 28),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
