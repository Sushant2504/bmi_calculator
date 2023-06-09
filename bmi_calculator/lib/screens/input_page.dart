import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import 'package:bmi_calculator/components/Iconcontent.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';
import 'package:bmi_calculator/calculator_brain.dart';


enum Gender{
 male,
 female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;
  // Color maleCardColour = inactiveCardColour;
  // Color femaleCardColour = inactiveCardColour;
  //
  // void updatecolour(Gender gender){
  //   if(gender == Gender.male){
  //     if(maleCardColour == inactiveCardColour){
  //       maleCardColour = activeCardColour;
  //       femaleCardColour = inactiveCardColour;
  //     }
  //     else{
  //       maleCardColour = inactiveCardColour;
  //     }
  //
  //   }
  //   if(gender == Gender.female){
  //     if(femaleCardColour == inactiveCardColour){
  //       femaleCardColour = activeCardColour;
  //       maleCardColour = inactiveCardColour;
  //     }
  //     else{
  //       femaleCardColour = inactiveCardColour;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(

            children: <Widget>[

              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
          ),
              ),

              Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
              ),
              ),
            ],
          )),
          Expanded(
              child: ReusableCard1(
                  colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text(
                   'HEIGHT',
                   style: labelTextStyle,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: <Widget>[
                     Text(
                       height.toString(),
                       style: kNumberTextStyle,
                     ),
                     Text(
                       'cm',
                       style: labelTextStyle,
                     )
                   ],
                 ),
                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     activeTrackColor: Colors.white,
                     thumbColor: Color(0xFFEB1555),
                     overlayColor: Color(0x29EB1555),
                     thumbShape:
                       RoundSliderThumbShape(enabledThumbRadius: 15.0),
                     overlayShape:
                       RoundSliderOverlayShape(overlayRadius: 30.0),
                   ),
                   child: Slider(
                     value: height.toDouble(),
                     min: 120.0,
                     max: 230.0,
                     inactiveColor: Color(0xFF8D8E98),
                     onChanged: (double newValue){
                       setState(() {
                         height = newValue.round();
                       });
                     },
                   ),
                 )
               ],
              ),)),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard1(
                      colour: activeCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                   weight--;
                                });
                              },
                            ),

                           SizedBox(
                             width: 10.0,
                           ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                weight++;
                              },
                          )
                          ]
                          ),
                        ],
                      ),
                       )),
              Expanded(
                  child: ReusableCard1(
                      colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),

                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  age++;
                                },
                              )
                            ]
                        ),
                      ],
                    ),)),
            ],
          )),

           BottomButtom(
               onTap: (){
                 CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                 Navigator.push(
                     context,
                     MaterialPageRoute(
                         builder: (context) => ResultsPage(
                           bmiResult: calc.CalculateBMI(),
                           ResultText: calc.getResult(),
                           interpretation: calc.getInterpretation(),
                         )));
               },
               buttonTitle: 'CALCULATE')
        ],
      ),

              // floatingActionButton: Theme(
        // data: ThemeData(accentColor: Colors.purple),
        // child: FloatingActionButton(
        //   onPressed: (){
        //
        //   },
        //   child: Icon(Icons.add),
        // ),

    );
  }
}





class RoundIconButton extends StatelessWidget{
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context){
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 0.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
       shape: CircleBorder(),
       fillColor: Color(0xFF4C4F5E),
    );
  }


}




// Container(
// height: 200,
// width: 170.0,
// margin: EdgeInsets.all(15.0),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0),
// ),
// ),