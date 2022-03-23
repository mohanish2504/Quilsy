import 'dart:math';

import 'package:app_flutter/pages/Clipboard/ClipboardManager.dart';
import 'package:flappy_search_bar_fork/flappy_search_bar.dart';
import 'package:flappy_search_bar_fork/scaled_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Clipboard'),
    Tab(text: 'Notes'),
  ];
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }
  double _mRadiusTabIndicator = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:SafeArea(
          child: Column(children: [
            SizedBox(height: 8,),
            Container(
              margin: EdgeInsets.only(left: 5,right: 5),
              child: TabBar(

                controller: _tabController,
                indicatorColor: Colors.green,
                tabs: myTabs,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                indicator: RectangularIndicator(
                  color: Colors.green[600],
                  bottomLeftRadius: _mRadiusTabIndicator,
                  bottomRightRadius: _mRadiusTabIndicator,
                  topLeftRadius: _mRadiusTabIndicator,
                  topRightRadius: _mRadiusTabIndicator,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: <Widget>[
                ClipboardManager(),
                new Column(
                  children: <Widget>[new Text("Notes")],
                )
              ]),
            )
          ])),
         );
  }
}
