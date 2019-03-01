import 'package:flutter/material.dart';
import 'package:geek_park/Widget/SlideView.dart';
import 'package:geek_park/http/Api.dart';
import 'package:geek_park/http/HttpUtil.dart';
import 'package:geek_park/item/PostItem.dart';

class FindPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FindPageState();
  }
}

class FindPageState extends State<FindPage> {
  List listData = new List();
  var bannerData;
  var currentPage = 0;
  var listTotalSize = 0;
  ScrollController _controller = new ScrollController();

  FindPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels) {
        getPost();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getPost();
  }

  @override
  Widget build(BuildContext context) {
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listview = new ListView.builder(
        itemCount: listData.length + 1,
        itemBuilder: (context, i) => buildItem(i),
        controller: _controller,
      );
      return new RefreshIndicator(child: listview, onRefresh: _pullToRefresh);
    }
  }

  SlideView _bannerView;

  void getPost() {
    String url = Api.HOME;
    url += "?page=$currentPage";
    HttpUtil.get(url, (data) {
      if (data != null) {
        var _banner = data['banner'];
        var _listData = data['homepage_posts'];
        setState(() {
          bannerData = _banner;
          _bannerView = new SlideView(bannerData);
          print(bannerData);

          List list = new List();
          if (currentPage == 0) {
            listData.clear();
          }
          currentPage++;
          list.addAll(listData);
          list.addAll(_listData);
          listData = list;
        });
      }
    });
  }

  Widget buildItem(int i) {
    if (i == 0) {
      return new Container(
        height: 180.0,
        child: _bannerView,
      );
    }
    i -= 1;
    var itemData = listData[i];
    return new PostItemPage(itemData['post'],"");
  }

  Future<Null> _pullToRefresh() {
    currentPage=0;
    getPost();
    return null;
  }
}
