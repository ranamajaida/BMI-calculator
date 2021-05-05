
import 'package:flutter/material.dart';

import '../constants.dart';

class NavigatorButton extends StatelessWidget {

  NavigatorButton({@required this.text, this.function});
  final String text;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: function,
             // Navigator.pushNamed(context, 'secondScreen');

            child: Container(
            child:
            Center(child: Text(text, style: kLargeButtonTextStyle,)),
            color: kBottomContainerColor,
            width: double.infinity,
            height:kBottomContainerHeigh,
             margin: EdgeInsets.only(top: 10.0),

),
);
  }
}
