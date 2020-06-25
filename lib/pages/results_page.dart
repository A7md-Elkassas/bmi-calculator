import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/new_cards.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResults, @required this.resultTxt, @required this.feedBack});

  final String bmiResults,resultTxt,feedBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                    style: kTitleStyle,
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child: NewCards(
              colored: kContainerColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultTxt.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResults,
                    style: kBmiResult,
                  ),
                  Text(
                    feedBack,
                    textAlign: TextAlign.center,
                    style: kBodyResultStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            tapp:(){

              Navigator.pop(context);
            },
            title: 'RECALCULATE',
          ),
        ],
      )
    );
  }
}
