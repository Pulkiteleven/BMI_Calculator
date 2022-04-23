import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calaculator/Iconcontent.dart';
import 'package:bmi_calaculator/slider.dart';
import 'ResultScreen.dart';
import 'Calci_Brain.dart';

class input_page extends StatefulWidget {
  const input_page({Key? key}) : super(key: key);







  @override
  _input_pageState createState() => _input_pageState();
}

class _input_pageState extends State<input_page> {

  late int heights = 120;
  late int weights = 30;
  late int age = 30;
  Color texColor = Color(0xFFECD0FF);
  Color active = Color(0xFFFF0066);
  Color trans_active = Color(0x29FF0066);

  Color selected_color = Color(0xFF270057);
  Color n_color = Color(0xFF17003B);

  Color male_color = Color(0xFF17003B);
  Color female_color = Color(0xFF17003B);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI Calculator')),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap:(){
                        setState(() {
                          male_color = selected_color;
                          female_color = n_color;
                        });
                      } ,
                        child: ItemContainer(
                            IconContent(FontAwesomeIcons.mars, 'MALE'),male_color))),
                Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          male_color = n_color;
                          female_color = selected_color;
                        });
                      },
                      child: ItemContainer(
                          IconContent(FontAwesomeIcons.venus, 'FEMALE'),female_color),
                    ))
              ],
            )),
            Expanded(child: Container(
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
                        heights.toString(),
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
                  ), child:  Slider(value: heights.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor: texColor,
                      onChanged:(double newVal){
                        setState(() {
                          heights = newVal.round();
                        });
                      }))

                ],
              ),
            )),

            Expanded(
                child: Row(
              children: [Expanded(child: Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0), color: Color(0xFF270057)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "WEIGHT",
                      style: TextStyle(
                        color: Color(0xFFECD0FF),
                      ),
                    ),
                    Text(
                      weights.toString(),
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
                              weights -= 1;
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
                              weights += 1;
                              print(heights);
                            });
                          },
                        )],
                    )

                  ]
                  ,
                )
                ,
              )),
                Expanded(child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0), color: Color(0xFF270057)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: TextStyle(
                          color: Color(0xFFECD0FF),
                        ),
                      ),
                      Text(
                        age.toString(),
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
                                age -= 1;
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
                                age += 1;
                              });
                            },
                          )],
                      )

                    ]
                    ,
                  )
                  ,
                ))],
            )),
            GestureDetector(
              onTap: ()
              {
                Calci_Brain cb = Calci_Brain(weights,heights);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return  Result(
                    bmiResult: cb.BMICalculator(),
                    resultText: cb.getshort(),
                    inter:cb.getResult() ,
                  );

                }));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                width: double.infinity,
                height: 60.0,
                color: Color(0xFFFF0066),
                child: Center(
                  child: Text('CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0
                  ),),
                ),


              ),
            )
          ],
        ));
  }
}

class Itemms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Color(0xFF270057)),
    );
  }
}

class ItemContainer extends StatelessWidget {
  ItemContainer(this.child,this.color);

  Widget child;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: color),
        child: child);
  }
}


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
