import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                          onTap: allClear,
                          buttonText: 'ac',
                          isOperator: true,
                        ),
                        Button(
                          onTap: clear,
                          buttonText: 'c',
                          isOperator: true,
                        ),
                        Button(
                          onTap: () => insertOperator('%'),
                          buttonText: '%',
                          isOperator: true,
                        ),
                        Button(
                          onTap: () => insertOperator('/'),
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
                          onTap: () => insertValue(7),
                          buttonText: '7',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertValue(8),
                          buttonText: '8',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertValue(9),
                          buttonText: '9',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertOperator('*'),
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
                          onTap: () => insertValue(4),
                          buttonText: '4',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertValue(5),
                          buttonText: '5',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertValue(6),
                          buttonText: '6',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertOperator('-'),
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
                          onTap: () => insertValue(1),
                          buttonText: '1',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertValue(2),
                          buttonText: '2',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertValue(3),
                          buttonText: '3',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => insertOperator('+'),
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
                          onTap: () => insertValue(0),
                          buttonText: '0',
                          isOperator: false,
                        ),
                        Button(
                          onTap: () => decimal(isSecondNumber ? num2 : num1),
                          buttonText: '.',
                          isOperator: true,
                        ),
                        Button(
                          onTap: () => neg(isSecondNumber ? num2 : num1),
                          buttonText: '+/-',
                          isOperator: true,
                        ),
                        Button(
                          onTap: () => calculate(operator),
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

  void nextNumber() {
    setState(() {
      isSecondNumber = true;
      controller.clear();
      helper = num1.toString() + operator;
    });
  }

  void calculate(String operator) {
    if (isSecondNumber) {
      switch (operator) {
        case '+':
          add(num1, num2);
          break;

        case '-':
          sub(num1, num2);
          break;

        case '/':
          div(num1, num2);
          break;

        case '*':
          mul(num1, num2);
          break;

        case '%':
          mod(num1, num2);
          break;
      }
      setState(() {
        controller.clear();
        helper = num1.toString() + operator + num2.toString();
        controller.value = TextEditingValue(text: result.toString());
        resultFound = true;
      });
    }
  }

  void insertOperator(String op) {
    operator = op;
    setState(() {
      nextNumber();
    });
  }

  void insertValue(int i) {
    if (resultFound) allClear();
    if (!isSecondNumber) {
      setState(() {
        if (controller.text == '0') {
          controller.value = TextEditingValue(text: i.toString());
        } else {
          String temp = controller.text;
          controller.value = TextEditingValue(text: temp + i.toString());
        }
        num1 = double.parse(controller.text);
      });
    } else {
      setState(() {
        if (controller.text == '0') {
          controller.value = TextEditingValue(text: i.toString());
        } else {
          String temp = controller.text;
          controller.value = TextEditingValue(text: temp + i.toString());
        }
        num2 = double.parse(controller.text);
      });
    }
  }

  void clear() {
    double temp;
    if (resultFound) allClear();
    if (!isSecondNumber) {
      temp = num1;
    } else {
      temp = num2;
    }
    temp = temp / 10;
    setState(() {
      if (!(temp.floor() == 0)) {
        controller.value = TextEditingValue(text: temp.floor().toString());
      } else {
        controller.value = TextEditingValue(text: '0');
      }
    });
  }

  void allClear() {
    if (resultFound) {
      resultFound = false;
    }
    setState(() {
      num1 = 0;
      num2 = 0;
      helper = '';
      result = 0;
      isSecondNumber = false;
      controller.clear();
      controller.value = TextEditingValue(text: '0');
    });
  }

  void add(double num1, double num2) {
    result = num1 + num2;
  }

  void sub(double num1, double num2) {
    result = num1 - num2;
  }

  void div(double num1, double num2) {
    result = num1 / num2;
  }

  void mul(double num1, double num2) {
    result = num1 * num2;
  }

  void mod(double num1, double num2) {
    result = num1 % num2;
  }

  void decimal(double d) {
    double temp = d + 0.0;
    isSecondNumber ? num2 = temp : num1 = temp;
  }

  void neg(double d) {
    setState(() {
      isSecondNumber ? num2 = -num2 : num1 = -num1;
    });
  }
}

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String buttonText;
  bool isOperator = false;
  Color color = Colors.white;
  Function onTap;
  Button({this.buttonText, this.isOperator, this.onTap});
  @override
  Widget build(BuildContext context) {
    if (isOperator) {
      color = Color(0xffA9A9A9);
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height / 9,
        child: Text(
          buttonText,
          style: TextStyle(color: color, fontSize: 30),
        ),
      ),
    );
  }
}
