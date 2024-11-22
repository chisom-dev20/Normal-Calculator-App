// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  
  CalculatorButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  String text;
  Color color;
  Color textColor;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 25,
              fontWeight: FontWeight.w700
            ),
          ),
        )
      ),
    );
  }
}