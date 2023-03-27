import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';




class BottomButtom extends StatelessWidget{
  BottomButtom({required this.onTap, required this.buttonTitle});

  final Function() onTap;
  final String buttonTitle;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: LargeButtonstyle,
        ),
        color: BottomContainerCardColour,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: BottomContainerheight,
      ),
    );
  }
}