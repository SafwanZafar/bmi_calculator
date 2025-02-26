import 'package:flutter/material.dart';
class ReuseCard extends StatelessWidget {
  Color colour;
  final cardChild;
 final  VoidCallback onPress;
ReuseCard({required this.colour, this.cardChild, required this.onPress});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10)

        ),
      ),
    );
  }
}
