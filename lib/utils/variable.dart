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
  }
}

const double padHorizontal = 16;
const double padVertical = 20;
