
import 'package:bmi_calc/screens/result_page.dart';

import '../calculator_function.dart';
import 'file:///G:/Users/Rana/AndroidStudioProjects/BMICalculator/BMI-calculator/bmi_calc/lib/components/navigator_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender{
  femal,
  male,
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height =180;
  int weight =60;
  int age = 20;


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(child: Row(
               children: [
                 Expanded(child: ResuableCardWidget(onPress:(){
                   setState(() {
                     selectedGender = Gender.male;
                   });

                 }
                   ,color:  selectedGender == Gender.male ? kActiveCardColor: kInActiveCardColor,
                   cardChild: IconContentWidget(
                     icon: FontAwesomeIcons.mars,
                     text: 'MALE',),
                 ),
                 ),
                 Expanded(child: ResuableCardWidget(onPress:(){
                   setState(() {
                     selectedGender = Gender.femal;
                   });
                 },color: selectedGender == Gender.femal ? kActiveCardColor: kInActiveCardColor,
                   cardChild:IconContentWidget(
                     icon: FontAwesomeIcons.venus,
                     text: 'FEMALE',),

                 ),
                 ),
               ],

          )
          ),
          Expanded(child: Row(
            children: [
              Expanded(child:ResuableCardWidget(color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: kLabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                          style: kLargeTextStyle,
                        ),
                        Text('cm',style: kLabelTextStyle),


                      ],
                    ),
                    
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),

                      ),
                      child: Slider(value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue){

                        setState(() {
                          height = newValue.round();
                        });

                      },
                      ),
                    )
                  ],

                ),
              ),
              ),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: ResuableCardWidget(color: kActiveCardColor,
                cardChild:
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('WEIGHT', style: kLabelTextStyle,),
                  Text(weight.toString(), style: kLargeTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedIconButton(icon: FontAwesomeIcons.plus,onPress:(){
                        setState(() {
                          weight < 150  ? weight++ : print('maximum weight is 30');
                        });

                      },),
                      SizedBox(width: 10.0,),
                      RoundedIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                        setState(() {

                          weight > 30 ? weight-- : print('minimum weigh is 30');
                        });

                      },),
                    ],

                  )

                ],

              ),)

              ),
              Expanded(child: ResuableCardWidget(color: kActiveCardColor, cardChild:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('AGE', style: kLabelTextStyle,),
                  Text(age.toString(), style: kLargeTextStyle,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedIconButton(icon: FontAwesomeIcons.plus,onPress:(){
                        setState(() {
                          age < 90  ? age++ : print('maximum weight is 90');
                        });

                      },),
                      SizedBox(width: 10.0,),
                      RoundedIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                        setState(() {

                          age > 20 ? age-- : print('minimum weigh is 20');
                        });

                      },),
                    ],

                  )

                ],

              ),)),
            ],
          )),



          NavigatorButton( text: 'CALCULATE',function:(){

            CalculatorBMI calc = CalculatorBMI(height: height ,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                bmiResult: calc.Calc(),
                ResultTxt: calc.getResult(),
                interpretationResult: calc.getInterpretation(),
            )));
          }
            ),
        ],

      )




    );
  }
}

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({this.icon, this.onPress});
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      onPressed:onPress,
    constraints: BoxConstraints.tightFor(
      width: 56,
      height: 56,
    ),
      elevation: 6.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      child: Icon(icon),


    );
  }
}

