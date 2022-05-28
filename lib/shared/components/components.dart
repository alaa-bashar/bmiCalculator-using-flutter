import 'package:bmicalculator/shared/components/constants.dart';
import 'package:flutter/material.dart';

Widget genderButton(
    {required String text,
    required Function onPressed,
    IconData iconData = Icons.male,
    double iconSize = 60,
    Color? iconColor,
    TextStyle? textStyle,
    Color? backgroundColor,
    double width = double.infinity,
    double allBordersRadius = 10}) {
  iconColor = currentTheme.elementsColor();
  textStyle = TextStyle(
      color: currentTheme.elementsColor(), fontWeight: FontWeight.bold);
  return Container(
    decoration: BoxDecoration(
        borderRadius:
            BorderRadiusDirectional.all(Radius.circular(allBordersRadius))),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: MaterialButton(
      onPressed: () => onPressed(),
      color: backgroundColor,
      minWidth: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          ),
          Text(text, style: textStyle),
        ],
      ),
    ),
  );
}

Widget crementerItem(
    {required String itemTitle,
    required int valueToCrement,
    required Function onIncrementButtonPressed,
    required Function onDecrementButtonPressed,
    required String unit,
    String incremenButtonHeroTag = "increament",
    String decremenButtonHeroTag = "decreament",
    Color? backgroundColor,
    Color? floatingButtonColor,
    TextStyle? itemTitleStyle,
    TextStyle? unitStyle,
    TextStyle? intialValueStyle,
    double width = double.infinity,
    double allBordersRadius = 10}) {
  itemTitleStyle = TextStyle(color: currentTheme.itemTitleColor());
  unitStyle = TextStyle(color: currentTheme.itemTitleColor(), fontSize: 20);
  intialValueStyle = TextStyle(
      color: currentTheme.elementsColor(),
      fontSize: 40,
      fontWeight: FontWeight.w800);
  return Container(
      decoration: BoxDecoration(
          color: currentTheme.bodyItemsColor(),
          borderRadius:
              BorderRadiusDirectional.all(Radius.circular(allBordersRadius))),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            itemTitle,
            style: itemTitleStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text((valueToCrement).toString(), style: intialValueStyle),
              const SizedBox(
                width: 5,
              ),
              Text(
                unit,
                style: unitStyle,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  onPressed: () => onDecrementButtonPressed(),
                  heroTag: decremenButtonHeroTag,
                  mini: true,
                  backgroundColor: currentTheme.floatingButtonsColor(),
                  child: const Icon(Icons.remove)),
              const SizedBox(
                width: 5,
              ),
              FloatingActionButton(
                  onPressed: () => onIncrementButtonPressed(),
                  heroTag: incremenButtonHeroTag,
                  mini: true,
                  backgroundColor: currentTheme.floatingButtonsColor(),
                  child: const Icon(Icons.add)),
            ],
          ),
        ],
      ));
}
