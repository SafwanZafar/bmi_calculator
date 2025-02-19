import 'package:flutter/material.dart';

import '../const/const.dart';
class Bottombutton extends StatefulWidget {
  final String buttonText;
  VoidCallback onPress;
   Bottombutton({super.key,required this.buttonText,required this.onPress});

  @override
  State<Bottombutton> createState() => _BottombuttonState();
}

class _BottombuttonState extends State<Bottombutton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:widget.onPress,
      child: Container(
        child: Center(child: Text(widget.buttonText,style: kLargeButtonText ),),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
