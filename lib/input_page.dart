import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'iconCard.dart';
import 'consts.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool male = false;
  int height = 160;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      color: male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconCard(icon: FontAwesomeIcons.mars, text: 'Male'),
                      onPressed: () {
                        setState(() {
                          male = true;
                          print('male');
                        });
                      }),
                ),
                Expanded(
                  child: ReusableCard(
                      color: !male ? kActiveCardColor : kInactiveCardColor,
                      cardChild: IconCard(icon: FontAwesomeIcons.venus, text: 'Female'),
                      onPressed: () {
                        setState(() {
                          male = false;
                          print('malen\'t');
                        });
                      }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kVeryLargeText,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 28),
                      thumbColor: kBottomButtonColor,
                      overlayColor: kBottomButtonColor.withAlpha(20),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.blueGrey,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 200,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomButtonColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomButtonHeight,
          ),
        ],
      ),
    );
  }
}
