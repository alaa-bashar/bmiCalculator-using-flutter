import 'dart:math';

import 'package:bmicalculator/models/bmi/bmi_model.dart';
import 'package:bmicalculator/modules/bmi/bmi_screen.dart';
import 'package:bmicalculator/shared/components/constants.dart';
import 'package:flutter/material.dart';

class BMIResultScreen extends StatefulWidget {
  const BMIResultScreen(
      {Key? key,
      required this.isMale,
      required this.height,
      required this.weight,
      required this.age})
      : super(key: key);

  final bool isMale;
  final int height;
  final int weight;
  final int age;

  @override
  State<BMIResultScreen> createState() => _BMIResultScreenState();
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  late BMIModel? bmiModel =
      buildBMIModel(widget.isMale, widget.height, widget.weight, widget.age);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const BMIScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: currentTheme.elementsColor(),
            )),
        title: Text(
          "BMI Result",
          style: TextStyle(
              color: currentTheme.elementsColor(), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: currentTheme.backgroundColor(),
      ),
      body: Container(
        width: double.infinity,
        color: currentTheme.backgroundColor(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: currentTheme.bodyItemsColor(),
                      borderRadius: const BorderRadiusDirectional.all(
                          Radius.circular(10))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${bmiModel?.caseName}",
                          style: TextStyle(
                              color: bmiModel?.caseColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Your BMI = "
                        "${bmiModel?.bmiValue.toStringAsFixed(1)}",
                        style: TextStyle(
                            color: currentTheme.buttonsColor(),
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: currentTheme.bodyItemsColor(),
                      borderRadius: const BorderRadiusDirectional.all(
                          Radius.circular(10))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender:  ",
                            style: TextStyle(
                              color: currentTheme.itemTitleColor(),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Height:  ",
                            style: TextStyle(
                              color: currentTheme.itemTitleColor(),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Weight:  ",
                            style: TextStyle(
                              color: currentTheme.itemTitleColor(),
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Age:  ",
                            style: TextStyle(
                              color: currentTheme.itemTitleColor(),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.isMale ? "Male" : "Female",
                            style: TextStyle(
                              color: currentTheme.elementsColor(),
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.height.toString() + "   cm",
                            style: TextStyle(
                              color: currentTheme.elementsColor(),
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.weight.toString() + "   kg",
                            style: TextStyle(
                              color: currentTheme.elementsColor(),
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            widget.age.toString() + "   years",
                            style: TextStyle(
                              color: currentTheme.elementsColor(),
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BMIModel? buildBMIModel(bool isMale, int height, int weight, int age) {
    double bmiValue = weight / pow(height / 100, 2);
    String caseName;
    Color caseColor;
    // if (age >= 18) {
    if (bmiValue > 40) {
      caseName = "Obese Class III";
      caseColor = Colors.red;
    } else if (bmiValue > 35) {
      caseName = "Obese Class II";
      caseColor = Colors.red;
    } else if (bmiValue > 30) {
      caseName = "Obese Class I";
      caseColor = Colors.red;
    } else if (bmiValue > 25) {
      caseName = "Overweight";
      caseColor = Colors.yellow;
    } else if (bmiValue > 18.5) {
      caseName = "Normal";
      caseColor = Colors.green;
    } else if (bmiValue > 17) {
      caseName = "Mild Thinness";
      caseColor = Colors.yellow;
    } else if (bmiValue > 16) {
      caseName = "Moderate Thinness";
      caseColor = Colors.red;
    } else {
      caseName = "Severe Thinness";
      caseColor = Colors.red;
    }
    return BMIModel(
        bmiValue: bmiValue, caseName: caseName, caseColor: caseColor);
    // }
  }
}
