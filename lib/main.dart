import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int times = 1 * 60;
  late Timer timer;

  void timeStart() {
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        times--;
      });
    });
  }

  void timeStop() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'my timer',
                      style: TextStyle(color: Colors.white, fontSize: 50),
                    ),
                  ),
                )),
            Flexible(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      '$times',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                )),
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        iconSize: 50,
                        onPressed: timeStart,
                        icon: Icon(
                          Icons.play_circle_rounded,
                          color: Colors.white,
                        )),
                    IconButton(
                        iconSize: 50,
                        onPressed: timeStart,
                        icon: Icon(Icons.pause_circle_rounded,
                            color: Colors.white))
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}