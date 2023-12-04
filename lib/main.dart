// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Teste controller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool clockwise = true;

  bool front = true;
  bool left = true;

  bool frontLeft = true;
  bool frontRight = false;
  bool rearLeft = false;
  bool rearRight = false;

  int frontLeftValue = 1;
  int frontRightValue = 2;
  int rearLeftValue = 3;
  int rearRightValue = 4;

  apertouFront() {
    if (front == false) {
      front = !front;
    }
    if (left) {
      //front left
      frontLeft = true;
      frontRight = false;
      rearLeft = false;
      rearRight = false;
    } else {
      //front right
      frontLeft = false;
      frontRight = true;
      rearLeft = false;
      rearRight = false;

      // left = false;
    }
    setState(() {});
  }

  apertouRear() {
    if (front == true) {
      front = !front;
    }

    if (left) {
      //rear left
      frontLeft = false;
      frontRight = false;
      rearLeft = true;
      rearRight = false;
    } else {
      //rear right
      frontLeft = false;
      frontRight = false;
      rearLeft = false;
      rearRight = true;

      // left = !left;
    }

    setState(() {});
  }

  apertouLeft() {
    if (left == false) {
      left = !left;
    }

    if (front) {
      //left front
      frontLeft = true;
      frontRight = false;
      rearLeft = false;
      rearRight = false;
    } else {
      //left rear
      frontLeft = false;
      frontRight = false;
      rearLeft = true;
      rearRight = false;

      // left = !left;
    }
    setState(() {});
  }

  apertouRight() {
    if (left == true) {
      left = !left;
    }

    if (front) {
      //right front
      frontLeft = false;
      frontRight = true;
      rearLeft = false;
      rearRight = false;
    } else {
      //rught rear
      frontLeft = false;
      frontRight = false;
      rearLeft = false;
      rearRight = true;

      // left = !left;
    }
    setState(() {});
  }

  apertouFrontLeft() {
    left = true;
    front = true;

    frontLeft = true;
    frontRight = false;
    rearLeft = false;
    rearRight = false;

    frontLeftValue = 1;
    if (clockwise) {
      frontRightValue = 2;
      rearRightValue = 3;
      rearLeftValue = 4;
    } else {
      frontRightValue = 4;
      rearRightValue = 3;
      rearLeftValue = 2;
    }

    setState(() {});
  }

  apertouFrontRight() {
    left = false;
    front = true;

    frontLeft = false;
    frontRight = true;
    rearLeft = false;
    rearRight = false;

    frontRightValue = 1;
    if (clockwise) {
      frontLeftValue = 4;
      rearRightValue = 2;
      rearLeftValue = 3;
    } else {
      frontLeftValue = 2;
      rearRightValue = 4;
      rearLeftValue = 3;
    }

    setState(() {});
  }

  apertouRearLeft() {
    left = true;
    front = false;

    frontLeft = false;
    frontRight = false;
    rearLeft = true;
    rearRight = false;

    rearLeftValue = 1;

    if (clockwise) {
      frontLeftValue = 2;
      frontRightValue = 3;
      rearRightValue = 4;
    } else {
      frontLeftValue = 4;
      rearRightValue = 2;
      frontRightValue = 3;
    }

    setState(() {});
  }

  apertouRearRight() {
    left = false;
    front = false;

    frontLeft = false;
    frontRight = false;
    rearLeft = false;
    rearRight = true;

    rearRightValue = 1;
    if (clockwise) {
      frontLeftValue = 3;
      frontRightValue = 4;
      rearLeftValue = 2;
    } else {
      frontLeftValue = 3;
      frontRightValue = 2;
      rearLeftValue = 4;
    }

    setState(() {});
  }

  apertouClockwise() {
    if (clockwise == false) {
      clockwise = !clockwise;
    }

    if (frontLeft) {
      apertouFrontLeft();
    } else if (frontRight) {
      apertouFrontRight();
    } else if (rearLeft) {
      apertouRearLeft();
    } else {
      apertouRearRight();
    }

    setState(() {});
  }

  apertouCounterClockwise() {
    if (clockwise == true) {
      clockwise = !clockwise;
    }

    if (frontLeft) {
      apertouFrontLeft();
    } else if (frontRight) {
      apertouFrontRight();
    } else if (rearLeft) {
      apertouRearLeft();
    } else {
      apertouRearRight();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0a2530),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToggleButton(
                text: "FRONT", onTapCallBack: apertouFront, isToggled: front),
            ToggleButton(
              text: "REAR",
              onTapCallBack: apertouRear,
              isToggled: !front,
            ),
            ToggleButton(
              text: "LEFT",
              onTapCallBack: apertouLeft,
              isToggled: left,
            ),
            ToggleButton(
              text: "RIGHT",
              onTapCallBack: apertouRight,
              isToggled: !left,
            ),
            Row(
              children: [
                NumberButton(
                    number: frontLeftValue,
                    isActive: frontLeft,
                    onTap: apertouFrontLeft),
                NumberButton(
                    number: frontRightValue,
                    isActive: frontRight,
                    onTap: apertouFrontRight),
              ],
            ),
            Row(
              children: [
                NumberButton(
                    number: rearLeftValue,
                    isActive: rearLeft,
                    onTap: apertouRearLeft),
                NumberButton(
                    number: rearRightValue,
                    isActive: rearRight,
                    onTap: apertouRearRight),
              ],
            ),
            Row(
              children: [
                ToggleButton(
                  isToggled: clockwise,
                  text: "CLOCKWISE",
                  onTapCallBack: apertouClockwise,
                ),
                ToggleButton(
                  isToggled: !clockwise,
                  text: "COUNTER CLOCKWISE",
                  onTapCallBack: apertouCounterClockwise,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isToggled;
  final onTapCallBack;

  const ToggleButton(
      {super.key,
      required this.text,
      required this.onTapCallBack,
      required this.isToggled});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallBack,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: isToggled ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text(
              isToggled ? 'ON' : 'OFF',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final bool isActive;
  final VoidCallback onTap;

  NumberButton(
      {required this.number, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: CircleAvatar(
        backgroundColor:
            isActive ? Colors.blue : Colors.grey, // Cor de fundo do círculo
        radius: 20.0, // Raio do círculo
        child: Text(
          '$number',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
