import 'dart:math';

import 'package:flutter/cupertino.dart';

class Calculator {
  Calculator({@required this.weight, @required this.height});

  final double height, weight;
  double _bmi;
  String calcBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Exercise more you fat fuck';
    } else if (_bmi > 18.5) {
      return 'Do whatever you are doing';
    } else {
      return 'Eat more donuts and pizza';
    }
  }
}
