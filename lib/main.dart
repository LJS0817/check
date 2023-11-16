import 'package:checking/check.dart';
import 'package:checking/time.dart';
import 'package:flutter/material.dart';

const Color themeColor = Color(0xFFacc2ef);
const Color backgroundColor = Color(0xff0f1c2e);
const Color backgroundColor2 = Color(0xff4d648d);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: SafeArea(
          child: Container(
              height: double.maxFinite,
              color: backgroundColor,
              child: Column(
                children: [
                  const TimeWidget(),
                  CheckList()
                ],
              )
          ),
        )
      ),
    );
  }
}
