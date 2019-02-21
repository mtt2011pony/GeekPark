import 'package:flutter/material.dart';
import 'package:geek_park/pages/PostListPage.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ChannelPageState();
  }
}

class ChannelPageState extends State<ChannelPage> {
  List list = new List();
  List titles = new List();

  void _itemClick(index) async {
    await Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new PostListPage(
        titles[index],
        index,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    titles.add("鹏友说");
    titles.add("每日必读");
    titles.add("顶楼");
    titles.add("极客之选");
    titles.add("极客出行");
    titles.add("产品观察");
    titles.add("极客现场");
    titles.add("综合报道");
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(itemCount: 8, itemBuilder: buildItem);
  }

  Widget buildItem(BuildContext context, int index) {
    return new GestureDetector(
      onTap: () {
        _itemClick(index);
      },
      child: new Padding(
          padding: EdgeInsets.fromLTRB(18.0, 10, 18.0, 14.0),
          child: new Image.asset('images/channel' + (1+index).toString() + '.png')),
    );
  }
}
