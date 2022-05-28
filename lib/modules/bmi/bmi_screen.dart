import 'package:bmicalculator/shared/components/components.dart';
import 'package:bmicalculator/shared/components/constants.dart';
import 'package:bmicalculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import '../bmi_results/bmi_results_screen.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: currentTheme.elementsColor(), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: currentTheme.backgroundColor(),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (isDark) {
                    isDark = false;
                    currentTheme = LightThemeColors();
                  } else {
                    isDark = true;
                    currentTheme = DarkThemeColors();
                  }
                });
              },
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: currentTheme.elementsColor(),
              ))
        ],
      ),
      body: Container(
        color: currentTheme.backgroundColor(),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: genderButton(
                        text: "MALE",
                        onPressed: () => setState(() => isMale = true),
                        backgroundColor: isMale
                            ? Colors.blue
                            : currentTheme.bodyItemsColor(),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: genderButton(
                          text: "FEMALE",
                          onPressed: () => setState(() => isMale = false),
                          backgroundColor: !isMale
                              ? Colors.red
                              : currentTheme.bodyItemsColor(),
                          iconData: Icons.female),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: currentTheme.bodyItemsColor(),
                        borderRadius: const BorderRadiusDirectional.all(
                            Radius.circular(10))),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style:
                              TextStyle(color: currentTheme.itemTitleColor()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              heightValue.toString(),
                              style: TextStyle(
                                  color: currentTheme.elementsColor(),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "cm",
                              style: TextStyle(
                                  color: currentTheme.itemTitleColor(),
                                  fontSize: 20),
                            ),
                          ],
                        ),
                        Slider(
                            value: heightValue.toDouble(),
                            min: 80,
                            max: 220,
                            thumbColor: currentTheme.buttonsColor(),
                            activeColor: currentTheme.buttonsColor(),
                            inactiveColor: currentTheme.floatingButtonsColor(),
                            onChanged: (value) {
                              setState(() {
                                heightValue = value.round();
                              });
                            })
                      ],
                    ),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: crementerItem(
                          itemTitle: "WEIGHT",
                          valueToCrement: weightValue,
                          onIncrementButtonPressed: () =>
                              setState(() => weightValue++),
                          onDecrementButtonPressed: () =>
                              setState(() => weightValue--),
                          unit: "kg",
                          decremenButtonHeroTag: "weightButtonDecrement",
                          incremenButtonHeroTag: "weightButtonIncrement"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        child: crementerItem(
                            itemTitle: "AGE",
                            valueToCrement: ageValue,
                            onIncrementButtonPressed: () =>
                                setState(() => ageValue++),
                            onDecrementButtonPressed: () =>
                                setState(() => ageValue--),
                            unit: "y",
                            decremenButtonHeroTag: "ageButtonDecrement",
                            incremenButtonHeroTag: "ageButtonIncrement")),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: currentTheme.buttonsColor(),
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                  )),
              clipBehavior: Clip.antiAlias,
              child: MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BMIResultScreen(
                                isMale: isMale,
                                height: heightValue,
                                weight: weightValue,
                                age: ageValue,
                              )));
                },
                child: const Text(
                  "CALCULATE",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
