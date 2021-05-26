import 'package:flutter/material.dart';
import 'package:myplant/data.dart';
import 'package:myplant/detailScreen.dart';
import 'package:myplant/utils/helper.dart';
import 'package:myplant/utils/myColor.dart' as colors;
import 'package:myplant/utils/fontStyles.dart' as fonts;
import 'package:myplant/utils/variable.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.pureWhite,
        leading: InkWell(
          onTap: () => prevScreen(context),
          child: Icon(
            Icons.arrow_back_rounded,
            color: colors.carbonBlack,
          ),
        ),
        title: Text('Favorite List',
            style: fonts.mulishHeadline6
                .merge(TextStyle(color: colors.carbonBlack)),
            textAlign: TextAlign.left),
        elevation: 0,
      ),
      body: SafeArea(
        child: RenderFavList(),
      ),
    );
  }
}

class RenderFavList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (favoriteData.length < 1) {
      return Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("No Plant added to Favorite List", style: fonts.mulishHeadline6),
          SizedBox(height: 10),
          InkWell(
            onTap: () => prevScreen(context),
            child: Text("Back to Home",
                style: fonts.mulishSubtitle1.merge(TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: colors.timberGreen))),
          )
        ],
      ));
    }
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: padHorizontal, vertical: 15),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: favoriteData.map((e) {
              return FavList(item: e);
            }).toList()),
      ),
    );
  }
}

class FavList extends StatelessWidget {
  final item;
  FavList({@required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: colors.puertoRico,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () => nextScreen(context, DetailPlant(item: item)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [
                    GetImage(imgName: item.image, imgWidth: 50),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.name,
                            style: fonts.mulishSubtitle1
                                .merge(TextStyle(fontFamily: 'Mulish-Bold'))),
                        Text(item.bioName,
                            style: fonts.openSansBody2
                                .merge(TextStyle(fontStyle: FontStyle.italic))),
                      ],
                    ),
                  ]),
                  // InkWell(
                  //     onTap: () => null,
                  //     child: Icon(Icons.remove_circle_outline,
                  //         color: colors.timberGreen))
                ],
              ),
            )),
      ),
    );
    ;
  }
}
