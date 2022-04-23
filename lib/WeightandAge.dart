import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class wandaitem extends StatefulWidget {
  final String label;

  const wandaitem({Key? key, required this.label}) : super(key: key);

  @override
  _wandaitemState createState() => _wandaitemState(label);
}


class _wandaitemState extends State<wandaitem> {
  final String label;
  int values = 30;
  _wandaitemState(this.label);

  Color selected_color = Color(0xFF270057);
  Color n_color = Color(0xFF17003B);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Color(0xFF270057)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        label,
        style: TextStyle(
          color: Color(0xFFECD0FF),
        ),
      ),
      Text(
        values.toString(),
        style: TextStyle(color: Colors.white, fontSize: 50.0),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
          backgroundColor: n_color,
          child: Icon(
            FontAwesomeIcons.minus,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              values -= 1;
            });
    },
    ),
    SizedBox(
    width: 5.0,
    ),
    FloatingActionButton(
    backgroundColor: n_color,
    child: Icon(
    FontAwesomeIcons.plus,
    color: Colors.white,
    ),
    onPressed: () {
      setState(() {
        values += 1;
        print(values);
      });
    },
    )],
    )

    ]
    ,
    )
    ,
    );
  }
}
