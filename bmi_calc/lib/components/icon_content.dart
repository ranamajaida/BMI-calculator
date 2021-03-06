import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class IconContentWidget extends StatelessWidget {
  IconContentWidget({this.text, this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),

        SizedBox(
          height: 10.0,
        ),

        Text(text,
            style: kLabelTextStyle,

        )



      ],

    );
  }
}
