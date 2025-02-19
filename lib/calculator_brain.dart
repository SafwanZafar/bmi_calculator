
import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height,required this.weight});
  final double height;
  final double weight;
  double _bmi= 0;
  String calculateBMI() {
     _bmi = weight/pow(height/100, 2);
  return  _bmi.toStringAsFixed(1);
  }
String getResult() {
    if(_bmi>=25) {
      return "Over weight ";
    }
    else if(_bmi>18.5){
      return "Normal";
    }
    else
      return "underWeight";
}
String getIntepretation() {
  if(_bmi>=25) {
    return "You have a higher than nomal body weight .";
  }
  else if(_bmi>18.5){
    return " You have a normal body weight .good job! ";
  }
  else
    return "You have a lower than normal body weight ";
}

}