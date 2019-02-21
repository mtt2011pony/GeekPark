import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SettingPageState();
  }
}

class SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.9;

    return new ListView(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                '登录',
                style: new TextStyle(fontSize: 18.0),
              ),
              width: maxWidth,
              height: 60.0,
              padding: EdgeInsets.all(18.0),
            ),
            new Icon(Icons.arrow_forward_ios)
          ],
        ),
        new Divider(
          height: 10.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                '清除缓存',
                style: new TextStyle(fontSize: 18.0),
              ),
              width: maxWidth,
              height: 60.0,
              padding: EdgeInsets.all(18.0),
            ),
            new Icon(Icons.arrow_forward_ios)
          ],
        ),
        new Divider(
          height: 10.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                '给极客公园好评',
                style: new TextStyle(fontSize: 18.0),
              ),
              width: maxWidth,
              height: 60.0,
              padding: EdgeInsets.all(18.0),
            ),
            new Icon(Icons.arrow_forward_ios)
          ],
        ),
        new Divider(
          height: 10.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                '吐槽反馈',
                style: new TextStyle(fontSize: 18.0),
              ),
              width: maxWidth,
              height: 60.0,
              padding: EdgeInsets.all(18.0),
            ),
            new Icon(Icons.arrow_forward_ios)
          ],
        ),
        new Divider(
          height: 10.0,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new Text(
                '版本号',
                style: new TextStyle(fontSize: 18.0),
              ),
              width: maxWidth,
              height: 60.0,
              padding: EdgeInsets.all(18.0),

            ),
            new Text('1.0.0',style: new TextStyle(fontSize: 14.0),)
          ],
        ),
        new Divider(
          height: 10.0,
        ),
      ],
    );
  }
}
