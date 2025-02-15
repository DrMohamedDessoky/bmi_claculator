import 'package:bmi/my_colors.dart';
import 'package:bmi/second_screen.dart'; // Ensure this file contains the SecondScreen class
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 180.0;
  int weight = 75;
  int age = 25;
  bool isActive = false;
  bool? isMale;

  double bmiValue() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.screenColor,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      if (!(isMale ?? false)) {
                        setState(() {
                          isMale = true;
                        });
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isMale ?? false
                              ? MyColors.widgetDeepColor
                              : MyColors.widgetLightColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/svg/male.svg",
                                width: 96,
                                height: 96,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: MyColors.textGreyColor,
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() {
                      isMale = false;
                    }),
                    child: Container(
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: isMale ?? true
                              ? MyColors.widgetLightColor
                              : MyColors.widgetDeepColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              SvgPicture.asset("assets/svg/female.svg",
                                  width: 96, height: 96),
                              Text("Female",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.textGreyColor,
                                  ))
                            ]))),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: MyColors.widgetLightColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: MyColors.textGreyColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.toInt()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: MyColors.textGreyColor,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        min: 1,
                        max: 200,
                        divisions: 200,
                        value: height,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        },
                        activeColor: MyColors.clickableButtonColor,
                        inactiveColor: MyColors.textGreyColor),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: MyColors.widgetDeepColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: MyColors.textGreyColor,
                          ),
                        ),
                        Text(
                          '$weight',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              backgroundColor: MyColors.widgetDeepColor,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              backgroundColor: MyColors.widgetDeepColor,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: MyColors.widgetLightColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: MyColors.textGreyColor,
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: MyColors.widgetLightColor,
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: MyColors.widgetLightColor,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SecondScreen(
                              bmiValue: bmiValue(),
                            )));
              },
              child: Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: MyColors.clickableButtonColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                ),
                child: Center(
                  child: Text(
                    'Calculate BMI',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              )),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
