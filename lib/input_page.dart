import 'package:bmi_calculator/resultsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusableCard.dart';
import 'iconCard.dart';
import 'consts.dart';
import 'package:bmi_calculator/Calculator.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  bool male = false;
  int height = 160;
  double weight = 60;
  int age = 18;

  void addWeight({int num = 5}) {
    if (weight < 395) weight += num;
  }

  void subWeight({int num = 5}) {
    if (weight > 4) weight -= num;
  }

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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight in Kg',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kVeryLargeText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconBtn(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  subWeight(num: 1);
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  addWeight(num: 1);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kVeryLargeText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconBtn(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconBtn(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age < 149) age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = new Calculator(weight: weight, height: height.toDouble());
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmi: calc.calcBMI(),
                  result: calc.getResult(),
                  interp: calc.getInterpretation(),
                );
              }));
            },
            child: Container(
              color: kBottomButtonColor,
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.only(bottom: 10),
              width: double.infinity,
              height: kBottomButtonHeight,
              child: Center(
                child: Text(
                  'Calculate',
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

class RoundIconBtn extends StatelessWidget {
  RoundIconBtn({this.icon, this.onPressed});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.black,
      ),
      onPressed: onPressed,
      elevation: 1,
      shape: CircleBorder(),
      fillColor: kBottomButtonColor,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
    );
  }
}
