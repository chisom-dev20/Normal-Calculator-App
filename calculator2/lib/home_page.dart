// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:calculator2/calculator_button.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String history = '';
  String expression = '';

  void onKeyTap(String text) {
    setState(() {
      expression += text;
    });
  }

  void clear() {
    expression = '';
    setState(() { });
  }

  void clearAll() {
    expression = '';
    history = '';
    setState(() { });
  }


   void evaluate() {
    // parse expression
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    
    // evaluate expression
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
    // update history
      history = expression;
    // update expression with result of evaluation
      expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: const Text(
          'Calculator',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              history,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                expression,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42
                ),
              ),
            )
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: 'AC',
                textColor: Colors.white,
                color: Colors.grey,
                onTap: () {
                  clearAll();
                },
              ),
              CalculatorButton(
                text: 'C',
                textColor: Colors.white,
                color: Colors.grey,
                onTap: () {
                  clear();
                },
              ),
              SizedBox(
                height: 65,
                width: 65,
              ),
              CalculatorButton(
                text: '/',
                textColor: Colors.green,
                color: Colors.white,
                onTap: () {
                 onKeyTap('/');
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: '7',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('7');
                },
              ),
              CalculatorButton(
                text: '8',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('8');
                },
              ),
              CalculatorButton(
                text: '9',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('9');
                },
              ),
              CalculatorButton(
                text: '*',
                textColor: Colors.green,
                color: Colors.white,
                onTap: () {
                  onKeyTap('*');
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: '4',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('4');
                },
              ),
              CalculatorButton(
                text: '5',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('5');
                },
              ),
              CalculatorButton(
                text: '6',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('6');
                },
              ),
              CalculatorButton(
                text: '-',
                textColor: Colors.green,
                color: Colors.white,
                onTap: () {
                  onKeyTap('-');
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: '1',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('1');
                },
              ),
              CalculatorButton(
                text: '2',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('2');
                },
              ),
              CalculatorButton(
                text: '3',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('3');
                },
              ),
              CalculatorButton(
                text: '+',
                textColor: Colors.green,
                color: Colors.white,
                onTap: () {
                  onKeyTap('+');
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalculatorButton(
                text: '.',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('.');
                },
              ),
              CalculatorButton(
                text: '0',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('0');
                },
              ),
              CalculatorButton(
                text: '00',
                textColor: Colors.white,
                color: Colors.transparent,
                onTap: () {
                  onKeyTap('00');
                },
              ),
              CalculatorButton(
                text: '=',
                textColor: Colors.green,
                color: Colors.white,
                onTap: () {
                  evaluate();
                },
              )
            ],
          ),
          Container(
            height: 20,
          )
        ]
      )
    );
  }
}

