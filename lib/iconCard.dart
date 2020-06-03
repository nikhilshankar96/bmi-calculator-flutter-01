import 'package:bmi_calculator/consts.dart';
import 'package:flutter/material.dart';
import 'consts.dart';

class IconCard extends StatelessWidget {
  IconCard({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
