import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = '0';
  String operand = '';
  double num1 = 0.0;
  double num2 = 0.0;
  String result = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      setState(() {
        output = '0';
        operand = '';
        num1 = 0.0;
        num2 = 0.0;
        result = '';
      });
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '*' ||
        buttonText == '/') {
      num1 = double.parse(output);
      operand = buttonText;
      setState(() {
        output = '0';
      });
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        result = (num1 + num2).toString();
      }
      if (operand == '-') {
        result = (num1 - num2).toString();
      }
      if (operand == '*') {
        result = (num1 * num2).toString();
      }
      if (operand == '/') {
        result = (num1 / num2).toString();
      }
      setState(() {
        output = result;
      });
    } else {
      setState(() {
        if (output == '0') {
          output = buttonText;
        } else {
          output += buttonText;
        }
      });
    }
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Colors.white,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            EdgeInsets.all(16.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              output,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                buildButton('C', 1, Colors.grey),
                buildButton('+/-', 1, Colors.grey),
                buildButton('%', 1, Colors.grey),
                buildButton('/', 1, Colors.orange),
                buildButton('7', 1, Colors.black54),
                buildButton('8', 1, Colors.black54),
                buildButton('9', 1, Colors.black54),
                buildButton('*', 1, Colors.orange),
                buildButton('4', 1, Colors.black54),
                buildButton('5', 1, Colors.black54),
                buildButton('6', 1, Colors.black54),
                buildButton('-', 1, Colors.orange),
                buildButton('1', 1, Colors.black54),
                buildButton('2', 1, Colors.black54),
                buildButton('3', 1, Colors.black54),
                buildButton('+', 1, Colors.orange),
                buildButton('0', 1, Colors.black54),
                buildButton('.', 1, Colors.black54),
                buildButton('=', 1, Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
