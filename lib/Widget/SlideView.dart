import 'package:flutter/material.dart';
import 'package:geek_park/pages/PostDetailPage.dart';

class SlideView extends StatefulWidget {
  var data;

  SlideView(this.data);

  @override
  State<StatefulWidget> createState() {
    return SlideViewState(data);
  }
}

class SlideViewState extends State<SlideView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  List data;

  SlideViewState(this.data);
  void _handOnItemClick(itemData) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new PostDetialPage(title:itemData['title'],url: itemData['id']);
    }));
  }
  @override
  void initState() {
    super.initState();
    tabController =
        new TabController(length: data == null ? 0 : data.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];
    if (data != null && data.length > 0) {
      for (var i = 0; i < data.length; i++) {
        var item = data[i];
        var imageUrl = item['cover_url'];
        var title = item['post_title'];
        print(data[i]);
//        var url = item['link'];
        items.add(new GestureDetector(
          onTap: () {_handOnItemClick(item);},
          child: AspectRatio(
            aspectRatio: 2.0 / 1.0,
            child: new Stack(
              children: <Widget>[
                new Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
                new Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: new Container(
                    width: 1000.0,
                    color: const Color(0x50000000),
                    padding: const EdgeInsets.all(5.0),
                    child: new Text(
                      title == null ? ' ' : title,
                      style: new TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      }
    }
    return new TabBarView(controller: tabController, children: items);
  }
}
