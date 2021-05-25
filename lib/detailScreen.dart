import 'package:flutter/material.dart';

class DetailPlant extends StatelessWidget {
  final item;
  DetailPlant({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text(item.name),
        ),
      ),
    );
  }
}
