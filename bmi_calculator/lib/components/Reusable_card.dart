import 'package:flutter/material.dart';




class ReusableCard extends StatelessWidget{

  ReusableCard({required this.colour,  this.cardChild = const SizedBox(),  required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function() onPress;
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


class ReusableCard1 extends StatelessWidget{

  ReusableCard1({required this.colour, this.cardChild = const SizedBox(),});

  final Color colour;
  final Widget cardChild;


  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}