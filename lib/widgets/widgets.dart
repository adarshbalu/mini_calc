import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final bool isOperator;

  Button({this.buttonText, this.isOperator});
  @override
  Widget build(BuildContext context) {
    Color color = Colors.white;
    if (isOperator) {
      color = Color(0xffA9A9A9);
    }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      height: MediaQuery.of(context).size.height / 9,
      width: MediaQuery.of(context).size.width / 4.5,
      child: Text(
        buttonText,
        textAlign: TextAlign.center,
        style: TextStyle(color: color, fontSize: 30),
      ),
    );
  }
}
