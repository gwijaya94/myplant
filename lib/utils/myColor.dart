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
Color puertoRico = parseColor('56B0A4'); //RGB(86,176,164)
Color whisperWhite = parseColor('EDEDED'); //RGB(237,237,247)
Color ghostWhite = parseColor('DFDFDF'); //RGB(223,223,223)
Color silverGrey = parseColor('656565'); //RGB(101,101,101)
