import 'dart:math';

class Calculation {

  final int height, weight;

  Calculation({this.weight, this.height});

 double _bmi;
  String calcBMI(){

     _bmi = weight / pow(height/100 , 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25) {
      return 'OverWeight';
    }
    else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight' ;
    }
  }

  String getFeedBack(){
    if (_bmi >= 25) {
      return 'You have a higher than normal body. Try to exercise more';
    }
    else if (_bmi > 18.5) {
      return 'You have a normal Weight. Good Job';
    } else {
      return 'You have a lower than normal body. You can eat alitle bit ' ;
    }
  }
}