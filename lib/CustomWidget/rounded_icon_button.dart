import 'package:flutter/material.dart';
class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
   RoundedIconButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Colors.white,),
        elevation: 6,
      shape: CircleBorder(),fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          width: 56,height: 56,
        ),
        onPressed:onPress);
  }
}
