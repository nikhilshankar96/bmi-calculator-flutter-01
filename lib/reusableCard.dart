import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //
  ReusableCard({@required this.color, this.cardChild, this.onPressed});
  final Function onPressed;
  final Color color;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
//        color: Colors.red,
        margin: EdgeInsets.all(12),
      ),
    );
  }
}
