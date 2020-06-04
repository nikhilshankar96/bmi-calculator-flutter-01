import 'package:bmi_calculator/consts.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.bmi, @required this.interp, @required this.result});
  final String bmi, interp, result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              'Your Result',
              style: kVeryLargeText,
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: Text(
                      result,
                      style: kLabelTextStyle,
                    ),
                  ),
                  Center(
                    child: Text(
                      bmi,
                      style: kVeryLargeText,
                    ),
                  ),
                  Center(
                    child: Text(
                      interp,
                      style: kLabelTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomButtonColor,
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: kBottomButtonHeight,
              child: Center(
                child: Text(
                  'Re-calculate',
                  style: kVeryLargeText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
