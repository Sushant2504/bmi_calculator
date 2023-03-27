import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';



class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.ResultText, required this.interpretation});

  final String bmiResult;
  final String ResultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'YOUR RESULT',
                  style: TitleTextstyle,
                ),
              )
          ),
          Expanded(
            flex: 5,
              child: ReusableCard1(
                colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      ResultText.toUpperCase(),
                    style: ResultTeststyle,),
                    Text(
                      bmiResult,
                      style: BmiTextstyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: BodyTextstyle,
                    )
                  ],
                ),
              ),
          ),
          BottomButtom(
              onTap: (){
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
