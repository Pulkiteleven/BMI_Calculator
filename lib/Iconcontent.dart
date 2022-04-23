import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {

  IconContent(this.icon,this.label);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color(0xFFECD0FF),
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
          style: TextStyle(color: Color(0xFFECD0FF)),)
      ],
    );
  }
}