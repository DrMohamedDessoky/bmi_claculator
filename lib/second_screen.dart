import 'package:bmi/my_colors.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.bmiValue,
  });
  final double bmiValue;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String bmiResult() {
    if (widget.bmiValue >= 25) {
      return "Overweight";
    } else if (widget.bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: MyColors.screenColor,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Second Screen',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Result",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: 503,
              decoration: BoxDecoration(
                  color: MyColors.widgetLightColor,
                  borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    children: [
                      SizedBox(height: 60.0),
                      Text(bmiResult(),
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20.0),
                      Text(widget.bmiValue.toStringAsFixed(1),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 64.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("You have a normal body weight. Good job!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: MyColors.textGreyColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            InkWell(
            
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MyColors.clickableButtonColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text("RE-CALCULATE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
