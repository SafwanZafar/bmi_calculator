import 'package:bmi_calculator/CustomWidget/reuse_card.dart';
import 'package:flutter/material.dart';

import 'CustomWidget/bottomButton.dart';
import 'const/const.dart';
class ResultPage extends StatelessWidget {
  final resultBmi;
  final resultText;
  final resultInterpretation;

   ResultPage({super.key, required this.resultBmi,required this.resultInterpretation,required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kActiveCardColor,
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Color(0xFF8D8E98)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(child: Padding(
             padding: const EdgeInsets.all(12),
             child: Container(
              alignment: Alignment.bottomLeft,
                     child: Text("Your Result ",style: kTitleTextStyle,),
             ),
           )),
          Expanded(
            flex: 5,
              child: ReuseCard(colour: kActiveCardColor, onPress: (){
  
          },cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toString(),style:kresultTextStyle,),
                  Text(resultBmi.toString(),style: kBmiTextStyle,),
                  Text(textAlign: TextAlign.center,
                    resultInterpretation.toString(),style: kBodyTextStyle,),


                ],
              ),),),
          Bottombutton(buttonText: 'Re-Calculate', onPress: (){
            Navigator.pop(context);
          })
      ],),
    );
  }
}
