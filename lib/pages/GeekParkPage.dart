import 'package:flutter/material.dart';
import 'package:geek_park/pages/FirstPage.dart';
import 'package:geek_park/pages/SecondPage.dart';
import 'package:geek_park/pages/ThirdPage.dart';
import 'package:geek_park/pages/FourthPage.dart';
import 'package:geek_park/pages/SearchPage.dart';

class GeekParkApp extends StatefulWidget {
  @override
  _GeekParkAppState createState() => new _GeekParkAppState();
}

class _GeekParkAppState extends State<GeekParkApp>
    with TickerProviderStateMixin {
  int _tabIndex = 0;
  List<BottomNavigationBarItem> _navigationViews;
  var appBarTitles = ['发现', '频道',  '设置'];
  var _body;

  initData() {
    _body = new IndexedStack(
      children: <Widget>[
        new FindPage(),
        new ChannelPage(),
//        new MinePage(),
        new SettingPage()
      ],
      index: _tabIndex,
    );
  }

  @override
  void initState() {
    super.initState();
    _navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          title: new Text(
            appBarTitles[0],
          ),
          backgroundColor: Colors.blue),
      new BottomNavigationBarItem(
          icon: const Icon(Icons.menu),
          title: new Text(
            appBarTitles[1],
          ),
          backgroundColor: Colors.blue),
//      new BottomNavigationBarItem(
//          icon: const Icon(Icons.account_box),
//          title: new Text(
//            appBarTitles[2],
//          ),
//          backgroundColor: Colors.blue),
      new BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          title: new Text(
            appBarTitles[2],
          ),
          backgroundColor: Colors.blue),
    ];
  }

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      navigatorKey: navigatorKey,
      theme:
          new ThemeData(primaryColor: Colors.blue, accentColor: Colors.grey),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            appBarTitles[_tabIndex],
            style: new TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () {
                  navigatorKey.currentState
                      .push(new MaterialPageRoute(builder: (context) {
                    return new SearchPage();
                  }));
                })
          ],
        ),
        body: _body,
        bottomNavigationBar: new BottomNavigationBar(
            items: _navigationViews
                .map((BottomNavigationBarItem navigationView) => navigationView)
                .toList(),
            currentIndex: _tabIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            }),
      ),
    );
  }
}
