import 'package:flutter/material.dart';
import 'package:minicalc/calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minimal Calculator',
      home: Calculator(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff060607),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xffE3E3E3),
          ),
        ),
      ),
    );
  }
}
