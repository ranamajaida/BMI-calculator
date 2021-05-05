
import 'dart:math';

class CalculatorBMI {

  CalculatorBMI({this.weight,this.height});
  final int weight;
  final int height;
  double _bmi;

  String Calc(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi >= 25){
      return 'Overweight';
    }

    else if(_bmi >= 18.5){
      return 'Normal';
    }

    else {
      return 'UnderWeight';
    }

  }


  String getInterpretation(){
    if(_bmi >= 25){
      return 'you have a heigher than normal body weight , Try to exercise more';
    }

    else if(_bmi >= 18.5){
      return 'you have a normal body weight, Good job';
    }

    else {
      return 'you have a lower than normal body weight , Try to eat more';
    }

  }

}