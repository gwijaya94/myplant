import 'package:flutter/material.dart';
import 'package:myplant/data.dart';
import 'package:myplant/utils/fontStyles.dart' as fonts;
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

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var outlinedBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: colors.silverChalice));
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // color: colors.avocadoGreen,
                  padding: EdgeInsets.fromLTRB(
                      padHorizontal, padVertical, padHorizontal, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          alignment: Alignment.centerRight,
                          child:
                              Icon(Icons.notifications_none_rounded, size: 26)),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text('My Plant',
                              style: fonts.mulishHeadline5,
                              textAlign: TextAlign.left)),
                      Theme(
                        data: ThemeData(
                            primaryColor: colors.silverChalice,
                            primaryColorDark: colors.silverChalice),
                        child: TextField(
                          cursorColor: colors.silverChalice,
                          style: TextStyle(color: colors.silverChalice),
                          onChanged: (val) {},
                          maxLines: 1,
                          decoration: InputDecoration(
                              hintText: 'Find your plant here ...',
                              hintStyle: TextStyle(color: colors.silverChalice),
                              border: outlinedBorder,
                              enabledBorder: outlinedBorder,
                              contentPadding: EdgeInsets.symmetric(vertical: 8),
                              prefixIcon: Icon(Icons.search,
                                  color: colors.silverChalice)),
                        ),
                      ),
                      SizedBox(height: 15)
                    ],
                  ),
                ),
                Expanded(child: TabBarComponent())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var plantCategories = ['All', 'Indoor', 'Outdoor'];

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padHorizontal),
              child: TabBar(
                  unselectedLabelColor: colors.carbonBlack,
                  labelColor: colors.carbonBlack,
                  indicatorColor: colors.puertoRico,
                  tabs: plantCategories.map((item) {
                    return Tab(child: Text(item, style: fonts.openSansBody1));
                  }).toList()),
            ),
          ),
          body: TabBarView(
              children: plantCategories.map((item) {
            return RenderPlant(filter: item);
          }).toList()),
        ));
  }
}

class RenderPlant extends StatelessWidget {
  final String filter;
  RenderPlant({@required this.filter});

  @override
  Widget build(BuildContext context) {
    var dataPlant = addFilteredData(filter.toLowerCase());

    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.symmetric(
            horizontal: padHorizontal, vertical: padVertical / 2),
        children: dataPlant.map((item) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(alignment: Alignment.bottomRight, children: [
                Container(
                  color: colors.whiteSmoke,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                      Text(dataPlant.length.toString(),
                          style: fonts.mulishHeadline5),
                      Text(item.name),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                  child: Container(
                      color: Colors.blueAccent,
                      child: IconButton(
                          splashRadius: 30,
                          icon: Icon(Icons.add),
                          onPressed: () {},
                          color: colors.pureWhite)),
                )
              ]));
        }).toList());
  }
}
