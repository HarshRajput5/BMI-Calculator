import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmistatus,
      required this.bmivalue,
      required this.description});

  final String bmistatus;
  final String bmivalue;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              child: const Center(
                child: Text(
                  "Your result",
                  style: TextStyle(fontSize: 40),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.lightBlueAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmistatus,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          bmivalue,
                          style: const TextStyle(fontSize: 50),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              description,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.pink,
                margin: const EdgeInsets.only(top: 10),
                height: 80,
                width: 400,
                child: const Center(
                  child: Text(
                    "Re-Calculate",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
