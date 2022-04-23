import 'package:flutter/material.dart';


class Result extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String inter;

  const Result({Key? key, required this.bmiResult, required this.resultText, required this.inter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body:
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Text('Your Result',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                ),),
            ),
          ),
          Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Color(0xFF270057)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(resultText, style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal,
                    ),),
                    Text(bmiResult,
                      style: TextStyle(
                          fontSize: 80.0,
                          color: Colors.white
                      ),),
                    Text(inter,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      ),),

                  ],
                ),
              )),
          GestureDetector(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: double.infinity,
              height: 60.0,
              color: Color(0xFFFF0066),
              child: Center(
                child: Text('RE-CALCULATE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0
                  ),),
              ),


            ),
          )
        ],)
      ,

    );
  }
}



