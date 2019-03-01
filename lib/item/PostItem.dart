import 'package:flutter/material.dart';
import 'package:geek_park/pages/PostDetailPage.dart';

class PostItemPage extends StatefulWidget {
  var itemData;
  var title;

  PostItemPage(var itemData, var title) {
    this.itemData = itemData;
    this.title = title;
  }

  @override
  State<StatefulWidget> createState() {
    return PostItemPageState();
  }
}

class PostItemPageState extends State<PostItemPage> {
  void _itemClick(itemData) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new PostDetialPage(
        title: itemData['title'],
        url: itemData['id'],
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    var colum = widget.itemData['column'];
    var columTitle = colum != null ? colum['title'] : widget.title;

    Row row1 = new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: new Padding(
            padding: EdgeInsets.all(4.0),
            child: new Text(columTitle,
              style: new TextStyle(color: Colors.black87, fontSize: 10.0),
            ),
          ),
          color: Color.fromARGB(255, 220, 220, 220),
        )
      ],
    );
    Row title = new Row(
      children: <Widget>[
        new Expanded(
            child: new Text(
          widget.itemData['title'],
          softWrap: true,
          style: new TextStyle(
            fontSize: 16.0,
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ))
      ],
    );
    double maxWidth = MediaQuery.of(context).size.width * 0.9;

    Row image = new Row(
      children: <Widget>[
        new Container(
            child: new Image.network(
              widget.itemData['cover_url'],
              fit: BoxFit.cover,
            ),
            height: 180.0,
            width:maxWidth ,
            color: Colors.black12)
      ],
    );
    var time = widget.itemData['reading_time'];
    Row bottom = new Row(
      children: <Widget>[
        new Text(
          "阅读时常 $time:00",
          style: new TextStyle(fontSize: 10.0),
        ),
        new Container(
          width: 16.0,
        ),
        new Icon(
          Icons.favorite_border,
          size: 12,
        ),
        new Text(
          widget.itemData['like_count'].toString(),
          style: new TextStyle(fontSize: 10.0),
        ),
      ],
    );
    Column all = new Column(
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.fromLTRB(18.0, 10.0, 0.0, 0.0),
          child: row1,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(18.0, 4.0, 8.0, 0.0),
          child: title,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(18.0, 8.0, 8.0, 0.0),
          child: image,
        ),
        new Padding(
          padding: EdgeInsets.fromLTRB(18.0, 8.0, 8.0, 0.0),
          child: bottom,
        ),
      ],
    );
    return new GestureDetector(
        child: new InkWell(
            child: all,
            onTap: () {
              _itemClick(widget.itemData);
            }));
  }
}
