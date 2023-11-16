import 'package:checking/check.dart';
import 'package:checking/dataProvider.dart';
import 'package:checking/title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color themeColor = Color(0xff8895cb);
const Color backgroundColor = Color(0xff10162d);
const Color backgroundColor2 = Color(0xff3c4670);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<DataProvider>(
        create: (_) => DataProvider(),
        child: MyHomePage(),
      )
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
                  TitleWidget(),
                  CheckList()
                ],
              )
          ),
        )
      ),
    );
  }
}
