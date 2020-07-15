import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minicalc/widgets/widgets.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController controller;
  double num1 = 0, num2 = 0, result = 0;
  String operator = '!', helper = '';
  bool isSecondNumber = false, resultFound = false;

  @override
  void initState() {
    controller = TextEditingController(text: num1.toString());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        helper,
                        style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: TextField(
                          controller: controller,
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          textDirection: TextDirection.rtl,
                          enableSuggestions: false,
                          enableInteractiveSelection: false,
                          autocorrect: false,
                          toolbarOptions: ToolbarOptions(paste: false),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 48,
                              fontWeight: FontWeight.w300),
                          cursorColor: Colors.tealAccent,
                          cursorRadius: Radius.circular(2),
                          cursorWidth: 2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
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
            ),
          )
        ]),
      ),
    );
  }
}
