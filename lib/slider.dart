import 'package:flutter/material.dart';
import 'inputpage.dart';


class slides extends StatefulWidget {
  const slides({Key? key}) : super(key: key);

  @override
  _slidesState createState() => _slidesState();
}

class _slidesState extends State<slides> {
  Color texColor = Color(0xFFECD0FF);
  Color active = Color(0xFFFF0066);
  Color trans_active = Color(0x29FF0066);

  int height = 120;

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
            'HEIGHT',
            style: TextStyle(
              color: texColor,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                height.toString(),
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              ),
              Text(
                "cm",
                style: TextStyle(
                  color: texColor,
                ),
              )
            ],
          ),
          SliderTheme(data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor: active,
            overlayColor: trans_active,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0)
          ), child:  Slider(value: height.toDouble(),
              min: 120.0,
              max: 220.0,
              inactiveColor: texColor,
              onChanged:(double newVal){
                setState(() {
                  height = newVal.round();
                });
              }))

        ],
      ),
    );
  }
}
