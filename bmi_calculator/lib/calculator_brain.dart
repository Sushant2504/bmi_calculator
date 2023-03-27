import 'dart:math';
import 'package:flutter/material.dart';


class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});
  int height;
  int weight;

  double _bmi = 18.0;

  String CalculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }


  String getResult(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }
    else if(_bmi>=18){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation(){

    if(_bmi>=25){
      return 'You have higher than the normal body weight. Try to Exercise more!';
    }
    else if(_bmi>=18){
      return 'You have the normal body weight. Good Job! Try to maintain it!';
    }
    else{
      return 'You have lower than the normal body weight. Try to gain some weight!';
    }
  }


}