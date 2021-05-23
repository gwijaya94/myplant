import 'package:flutter/material.dart';
import 'package:myplant/utils/variable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Plant',
        theme: ThemeData(),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var myColor = MyColor();
    var appConfig = AppConfig(context);
    var padHori = appConfig.padHorizontal;
    var padVerti = appConfig.padVertical;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(padHori, padVerti, padHori, 0),
                color: myColor.avocadoGreen,
                child: Text('Text')),
          ],
        ),
      ),
    );
  }
}
