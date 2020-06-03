import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.black,
//        scaffoldBackgroundColor: Color(0xff070912),
        scaffoldBackgroundColor: Colors.black,
        accentColor: Colors.cyan,
//        textTheme: TextTheme(
//          bodyText2: TextStyle(color: Colors.white),
//        ),
      ),
      home: InputPage(),
    );
  }
}
