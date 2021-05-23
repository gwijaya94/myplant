import 'package:flutter/material.dart';

class AppConfig {
  BuildContext context;
  var screenWidth;
  var screenHeight;
  var orientation;
  double padHorizontal;
  double padVertical;

  AppConfig(this.context) {
    MediaQueryData queryData = MediaQuery.of(context);
    screenWidth = queryData.size.width;
    screenHeight = queryData.size.height;
    orientation = queryData.orientation;
    padHorizontal = 16;
    padVertical = 20;
  }
}

class MyColor {
  Color whiteSmoke;
  Color coniferGreen;
  Color atlantisGreen;
  Color silverChalice;
  Color timberGreen;
  Color avocadoGreen;
  Color pureWhite;

  Color parseColor(var hexColor) {
    var intColor = '0xff' + hexColor;
    return Color(int.parse(intColor));
  }

  MyColor() {
    whiteSmoke = parseColor('F0f0f0');
    coniferGreen = parseColor('9CE05A');
    atlantisGreen = parseColor('84D63B');
    silverChalice = parseColor('ABB4A3');
    timberGreen = parseColor('304534');
    avocadoGreen = parseColor('989B6F');
    pureWhite = parseColor('FFFFFF');
  }
}

class MyStyles {
  MyStyles() {
    const oxygenStyles = TextStyle(fontFamily: 'Oxygen');
  }
}
