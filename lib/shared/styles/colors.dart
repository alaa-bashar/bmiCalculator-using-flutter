import 'package:flutter/material.dart';

abstract class AppTheme {
  Color backgroundColor();
  Color bodyItemsColor();
  Color buttonsColor();
  Color floatingButtonsColor();
  Color elementsColor();
  Color itemTitleColor();
}

class DarkThemeColors extends AppTheme {
  @override
  Color backgroundColor() => const Color(0xff080e1c);

  @override
  Color bodyItemsColor() => const Color(0xff191a2c);

  @override
  Color buttonsColor() => const Color(0xffe6134a);

  @override
  Color floatingButtonsColor() => const Color(0xff414551);

  @override
  Color elementsColor() {
    return Colors.white;
  }

  @override
  Color itemTitleColor() {
    return Colors.grey;
  }
}

class LightThemeColors extends AppTheme {
  @override
  Color backgroundColor() => Colors.white;

  @override
  Color bodyItemsColor() => Colors.grey.shade400;
  // Color bodyItemsColor() => const Color(0xff8A97FF);

  @override
  Color buttonsColor() => const Color(0xffe6134a);

  @override
  Color floatingButtonsColor() => const Color(0xff414551);

  @override
  Color elementsColor() {
    return Colors.black;
  }

  @override
  Color itemTitleColor() {
    return Colors.black87;
  }
}
