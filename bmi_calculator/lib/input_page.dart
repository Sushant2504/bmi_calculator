import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerheight = 80.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerCardColour = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(

            children: <Widget>[

              Expanded(child: ReusableCard(
                colour: activeCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),
          ),
              ),

              Expanded(child: ReusableCard(
                colour: activeCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
              )),
            ],
          )),
          Expanded(child: ReusableCard(colour: activeCardColour,)),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(colour: activeCardColour,)),
              Expanded(child: ReusableCard(colour: activeCardColour,)),
            ],
          )),
          Container(
            color: bottomContainerCardColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerheight,
          ),
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


class IconContent extends StatelessWidget{
  IconContent({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,

        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: TextStyle(
          fontSize: 80.0, color: Color(0xFF8D8E98),
        ),)
      ],
    );
  }
}

class ReusableCard extends StatelessWidget{
  
  ReusableCard({required this.colour,  this.cardChild});
  
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardChild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
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