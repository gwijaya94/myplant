import 'package:flutter/material.dart';
import 'package:myplant/data.dart';
import 'package:myplant/utils/fontStyles.dart' as fonts;
import 'package:myplant/utils/helper.dart';
import 'package:myplant/utils/myColor.dart' as colors;
import 'package:myplant/utils/variable.dart';

class DetailPlant extends StatelessWidget {
  final item;
  DetailPlant({@required this.item});

  @override
  Widget build(BuildContext context) {
    var itemName = item.name;
    var itemBioName = item.bioName;
    if (itemBioName.length > 15) {
      itemBioName = itemBioName.replaceAll(' ', ' \n');
    }
    if (itemName.length > 15) {
      itemName = itemName.replaceAll(' ', ' \n');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.ghostWhite,
        elevation: 0,
        leading: InkWell(
            onTap: () => prevScreen(context),
            child: Icon(Icons.arrow_back_rounded, color: colors.carbonBlack)),
        actions: [FavIcon(item: item), SizedBox(width: 16)],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        color: colors.ghostWhite,
                        padding: EdgeInsets.fromLTRB(
                            padHorizontal, padVertical, padHorizontal, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text('Details',
                                style: fonts.mulishHeadline4,
                                textAlign: TextAlign.left),
                            SizedBox(height: 5),
                            Container(
                              height: 5,
                              alignment: Alignment.centerLeft,
                              child: VerticalDivider(
                                width: 60,
                                thickness: 60,
                                color: colors.puertoRico,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text('Plant Name',
                                style: fonts.openSansBody2,
                                textAlign: TextAlign.left),
                            Text(itemName,
                                style: fonts.mulishHeadline6,
                                textAlign: TextAlign.left),
                            SizedBox(height: 20),
                            Text('Bio Name',
                                style: fonts.openSansBody2,
                                textAlign: TextAlign.left),
                            Text(itemBioName,
                                style: fonts.mulishHeadline6.merge(
                                    TextStyle(fontStyle: FontStyle.italic)),
                                textAlign: TextAlign.left),
                            SizedBox(height: 20),
                            Text('Price Approx.',
                                style: fonts.openSansBody2,
                                textAlign: TextAlign.left),
                            Text('USD ${item.price.toStringAsFixed(2)}',
                                style: fonts.mulishHeadline6,
                                textAlign: TextAlign.left),
                            SizedBox(height: 30),
                          ],
                        )),
                    SizedBox(height: 40),
                  ],
                ),
                Positioned(
                  left: 0,
                  right: -200,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    child: GetImage(imgName: item.image),
                  ),
                )
              ],
            ),
            Container(
                padding: EdgeInsets.fromLTRB(
                    padHorizontal, 0, padHorizontal, padVertical),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('About',
                        style: fonts.mulishHeadline5,
                        textAlign: TextAlign.left),
                    SizedBox(height: 10),
                    Text(item.desc,
                        style: fonts.openSansBody1, textAlign: TextAlign.left),
                  ],
                )), //for description
          ],
        ),
      )),
    );
  }
}

class FavIcon extends StatefulWidget {
  final item;
  FavIcon({@required this.item});

  @override
  _FavIconState createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    var data = widget.item;
    var indexData =
        favoriteData.indexWhere((element) => element.name == data.name);

    return Flexible(
      child: InkWell(
          onTap: () {
            setState(() {
              var snackBarText = '';
              if (indexData < 0) {
                favoriteData.add(data);
                snackBarText = "Added to Favorite List";
              } else {
                favoriteData.removeAt(indexData);
                snackBarText = "Remove from Favorite List";
              }
              isFav = !isFav;
              showSnackBar(context, text: snackBarText);
            });
          },
          child: Icon(indexData >= 0 ? Icons.eco : Icons.eco_outlined,
              color: colors.timberGreen, size: 40)),
    );
  }
}
