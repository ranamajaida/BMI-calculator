import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'firstScreen',
      routes: {
        'firstScreen': (context) => InputPage(),
        'secondScreen': (context) => ResultPage(),

      },

      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff1D1F33),
        scaffoldBackgroundColor: Color(0xFF090C21),
      ),
    );
  }
}





