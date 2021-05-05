import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/navigator_button.dart';
import '../components/reusable_card.dart';


class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.ResultTxt,@required this.interpretationResult});

  final String bmiResult;
  final String ResultTxt;
  final String interpretationResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text( 'BMI Calculator'),centerTitle: true,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('YOUR RESULT',style: kTittleTextStyle,),margin: EdgeInsets.only(top: 20.0,left: 10.0,right: 10),),
          ),

          Expanded(
            flex: 5,
            child: ResuableCardWidget( color: kActiveCardColor,cardChild: Column(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(ResultTxt.toUpperCase(),style: kResultTextStyle,),
                Text(bmiResult,style: kBMITextStyle,),
                Text(interpretationResult,
                  style: kBodyTextStyle,
                  textAlign: TextAlign.center,
                )

              ],
            ),

            ),


          ),

          NavigatorButton(text:'RE-CALCULATE', function: (){
            Navigator.pushNamed(context, 'firstScreen');

          })
        ],

      ),

    );
  }
}

