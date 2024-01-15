import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _expression = '';
        _result = '';
      } else if (buttonText == '=') {
        try {
          _result = _evaluateExpression();
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += buttonText;
      }
    });
  }

  String _evaluateExpression() {
    String expression = _expression;

    // Replace 'x' with '*' and '÷' with '/'
    expression = expression.replaceAll('x', '*').replaceAll('÷', '/');

    // Use Dart's built-in 'dart:math' library to evaluate the expression
    double result = evalExpression(expression);
    return result.toString();
  }

  double evalExpression(String expression) {
    try {
      return double.parse(expression);
    } catch (e) {
      print('Error parsing expression: $e');
      throw Exception('Error evaluating expression');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 24.0),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[300],
              child: Column(
                children: [
                  buildButtonRow(['7', '8', '9', '÷']),
                  buildButtonRow(['4', '5', '6', 'x']),
                  buildButtonRow(['1', '2', '3', '-']),
                  buildButtonRow(['0', 'C', '=', '+']),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons
            .map(
              (buttonText) => Expanded(
            child: ElevatedButton(
              onPressed: () => _onButtonPressed(buttonText),
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 24.0),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
