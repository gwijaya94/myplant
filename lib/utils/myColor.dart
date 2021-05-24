import 'package:flutter/material.dart';

Color parseColor(var hexColor) {
  var intColor = '0xff' + hexColor;
  return Color(int.parse(intColor));
}

Color whiteSmoke = parseColor('F0f0f0'); //RGB(240,240,240)
Color coniferGreen = parseColor('9CE05A'); //RGB(156,224,90)
Color atlantisGreen = parseColor('84D63B'); //RGB(132, 214, 59)
Color silverChalice = parseColor('ABB4A3'); //RGB(171, 180, 163)
Color timberGreen = parseColor('304534'); //RGB(48, 69, 52)
Color avocadoGreen = parseColor('989B6F'); //RGB(152, 155, 111)
Color pureWhite = parseColor('FFFFFF'); //RGB(255,255,255)
Color carbonBlack = parseColor('212121'); //RGB(33,33,33)
Color puertoRico = parseColor('55B1A6'); //RGB(85,177,166)
