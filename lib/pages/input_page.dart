import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/new_cards.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/my_button.dart';
import '../calculation.dart';

enum Type { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Type selectedGender;
  int height = 150;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: NewCards(
                      onPress: () {
                        setState(() {
                          selectedGender = Type.Male;
                        });
                      },
                      colored: selectedGender == Type.Male
                          ? kContainerColor
                          : kInactiveContainerColor,
                      cardChild: IconContent(
                        myIcon: FontAwesomeIcons.mars,
                        type: 'Male',
                      )),
                ),
                Expanded(
                  child: NewCards(
                    onPress: () {
                      setState(() {
                        selectedGender = Type.Female;
                      });
                    },
                    colored: selectedGender == Type.Female
                        ? kContainerColor
                        : kInactiveContainerColor,
                    cardChild: IconContent(
                      myIcon: FontAwesomeIcons.venus,
                      type: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: NewCards(
              colored: kContainerColor,
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
                        style: kNumbersStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff808E98),
                        thumbColor: Color(0xffEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 10),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 25)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,
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
                  child: NewCards(
                    colored: kContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                myPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                            ),
                            Expanded(
                                child: RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              myPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: NewCards(
                    colored: kContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumbersStyle,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  myPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  myPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
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
          BottomButton(
            tapp: () {
              Calculation calc = Calculation(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: calc.calcBMI(),
                    resultTxt: calc.getResult(),
                    feedBack: calc.getFeedBack(),
                  ),
                ),
              );
            },
            title: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
