import 'package:flutter/material.dart';
import 'package:myplant/data.dart';
import 'package:myplant/detailScreen.dart';
import 'package:myplant/favScreen.dart';
import 'package:myplant/utils/fontStyles.dart' as fonts;
import 'package:myplant/utils/helper.dart';
import 'package:myplant/utils/myColor.dart' as colors;
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.pureWhite,
        title: Text('My Plant',
            style: fonts.mulishHeadline5
                .merge(TextStyle(color: colors.carbonBlack)),
            textAlign: TextAlign.left),
        elevation: 0,
        actions: [
          InkWell(
            onTap: () => nextScreen(context, FavoriteScreen()),
            child: Icon(Icons.eco, size: 40, color: colors.timberGreen),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: TabBarComponent(),
      ),
    );
  }
}

class TabBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: plantCategories.length,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: padHorizontal),
            child: TabBar(
                unselectedLabelColor: colors.carbonBlack,
                labelColor: colors.carbonBlack,
                indicatorColor: colors.puertoRico,
                tabs: plantCategories.map((item) {
                  return Tab(child: Text(item, style: fonts.openSansBody1));
                }).toList()),
          ),
          Expanded(
            child: Container(
              color: colors.ghostWhite,
              child: TabBarView(
                  children: plantCategories.map((item) {
                return RenderPlant(filter: item);
              }).toList()),
            ),
          ),
        ],
      ),
    );
  }
}

class RenderPlant extends StatelessWidget {
  final String filter;
  RenderPlant({@required this.filter});

  @override
  Widget build(BuildContext context) {
    var dataPlant = addFilteredData(filter.toLowerCase());

    if (dataPlant.length < 1) {
      return Center(
          child: Text(
        "Sorry, plant for this category is unavailable right now.\n\nPlease check another time later.",
        style: fonts.mulishHeadline6,
        textAlign: TextAlign.center,
      ));
    }
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.1,
        padding: EdgeInsets.symmetric(
            horizontal: padHorizontal, vertical: padVertical / 2),
        children: dataPlant.map((item) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () => nextScreen(context, DetailPlant(item: item)),
              child: Container(
                color: colors.whisperWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: GetImage(imgName: item.image)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: fonts.openSansBody2,
                                  overflow: TextOverflow.ellipsis),
                              Text('USD ${item.price.toStringAsFixed(2)}',
                                  style: fonts.openSansSubhead.merge(TextStyle(
                                      fontFamily: 'OpenSans-Bold',
                                      color: colors.silverGrey))),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(10)),
                            child: Container(
                              color: colors.puertoRico,
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  color: colors.pureWhite,
                                  onPressed: () => checkoutData.add(item)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList());
  }
}
