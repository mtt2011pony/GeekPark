import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextField serachView = new TextField(autofocus: true,
      decoration: new InputDecoration(
          border: InputBorder.none, hintText: 'SEARCH'),);
    return Scaffold(appBar:new AppBar(title: serachView,actions: <Widget>[new CloseButton(),],),);
  }
}
