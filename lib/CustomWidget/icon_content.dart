import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../const/const.dart';
//    *******************   Custom TextStyle Use  **********************************8

class IconContent extends StatelessWidget {
  final IconData icon;
   final String label;

   IconContent({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,size: 60,color: Colors.white,),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style:kLabelTextStyle
          ),
      ],
    );
  }
}
