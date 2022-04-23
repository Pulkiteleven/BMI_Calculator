import 'package:flutter/material.dart';
import 'inputpage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'mons',
      textTheme: TextTheme(
        bodyText1: TextStyle(color: Colors.white)
      ),
      primaryColor: Color(0xFF140040),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF0B0023),
      ),


      scaffoldBackgroundColor: Color(0xFF0B0026)
    ),
    home: input_page(),
  ));
}




