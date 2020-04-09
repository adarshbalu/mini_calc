import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '147+272',
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        '419',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(color: Color(0xff060607)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Button(
                        buttonText: 'ac',
                        isOperator: true,
                      ),
                      Button(
                        buttonText: 'c',
                        isOperator: true,
                      ),
                      Button(
                        buttonText: '%',
                        isOperator: true,
                      ),
                      Button(
                        buttonText: '/',
                        isOperator: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Button(
                        buttonText: '7',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '8',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '9',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '*',
                        isOperator: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Button(
                        buttonText: '4',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '5',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '6',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '-',
                        isOperator: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Button(
                        buttonText: '1',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '2',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '3',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '+',
                        isOperator: true,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Button(
                        buttonText: '0',
                        isOperator: false,
                      ),
                      Button(
                        buttonText: '.',
                        isOperator: true,
                      ),
                      Button(
                        buttonText: '+/-',
                        isOperator: true,
                      ),
                      Button(
                        buttonText: '=',
                        isOperator: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class Button extends StatelessWidget {
  String buttonText;
  bool isOperator = false;
  Color color = Colors.white;
  Button({this.buttonText, this.isOperator});
  @override
  Widget build(BuildContext context) {
    if (isOperator) {
      color = Color(0xffA9A9A9);
    }
    return Container(
      margin: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height / 9,
      child: Text(
        buttonText,
        style: TextStyle(color: color, fontSize: 30),
      ),
    );
  }
}
