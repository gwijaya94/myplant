import 'package:flutter/material.dart';
import 'package:myplant/utils/fontStyles.dart';
import 'package:myplant/utils/myColor.dart';

class GetImage extends StatelessWidget {
  final String imgName;
  final double imgWidth;
  final double imgHeight;
  final BoxFit fit;
  const GetImage(
      {@required this.imgName, this.imgWidth, this.imgHeight, this.fit});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/$imgName',
      width: imgWidth,
      height: imgHeight,
      fit: fit,
    );
  }
}

class GetNetworkImage extends StatelessWidget {
  final String imgUrl;
  final double imgWidth;
  final double imgHeight;
  const GetNetworkImage({@required this.imgUrl, this.imgWidth, this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Image.network('$imgUrl', width: imgWidth, height: imgHeight);
  }
}

void nextScreen(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

void prevScreen(BuildContext context) {
  Navigator.pop(context);
}

void showSnackBar(BuildContext context,
    {@required String text, int seconds = 1}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text, style: mulishSubtitle1),
    duration: Duration(seconds: seconds),
    backgroundColor: timberGreen,
  ));
}
