import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EMICalculator(),
    );
  }
}

class EMICalculator extends StatefulWidget {
  @override
  _EMICalculatorState createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  double price = 100000.0; // Default price value
  double rate = 12.0; // Default rate value
  double time = 12.0; // Default time value
  String emiResult = '';

  void calculateEMI() {
    double P = price;
    double R = rate / 12 / 100;
    double N = time;

    double answer = P * R * pow((1 + R), N) / ((pow(1 + R, N)) - 1);

    setState(() {
      emiResult = '₹${answer.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 900,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black,
                  Colors.deepPurple,
                  Colors.deepPurple,
                  Colors.deepPurple,
                ])),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.apps_sharp,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      'EMI Calculator',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Your Loan EMI is',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  emiResult,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Container(
              height: 800,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Loan Amount",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    value: price,
                    min: 10000.0,
                    max: 1000000.0,
                    divisions: 100,
                    label: 'Price: ₹${price.toStringAsFixed(0)}',
                    onChanged: (value) {
                      setState(() {
                        price = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Interest Rate",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    value: rate,
                    min: 0.1,
                    max: 30.0,
                    divisions: 290,
                    label: 'Rate: ${rate.toStringAsFixed(1)}%',
                    onChanged: (value) {
                      setState(() {
                        rate = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Loan Tenure",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  Slider(
                    value: time,
                    min: 1.0,
                    max: 60.0,
                    divisions: 59,
                    label: 'Time: ${time.toStringAsFixed(0)} months',
                    onChanged: (value) {
                      setState(() {
                        time = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: calculateEMI,
                    child: Container(
                        height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color(0xffE7EAFF),
                            border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          'Calculate',
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
