import 'package:flutter/material.dart';
import 'package:geek_park/http/Api.dart';
import 'package:geek_park/http/HttpUtil.dart';
import 'package:geek_park/item/PostItem.dart';

class PostListPage extends StatefulWidget {
  var title;
  int columnId;

  PostListPage(var title, int id) {
    this.title = title;
    this.columnId = id;
  }

  @override
  State<StatefulWidget> createState() {
    return new PostListPageState();
  }
}

class PostListPageState extends State<PostListPage> {
  List listData = new List();
  List<int> ids = [251,251,177,81,250,85,12,179];

  var currentPage=1;
  var listTotalSize = 0;
  ScrollController _controller = new ScrollController();

  PostListPageState() {
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixels = _controller.position.pixels;
      if (maxScroll == pixels) {
        getPost();
      }
    });
//    ids.add(251);
//    ids.add(251);//每日必读
//    ids.add(177);//顶楼
//    ids.add(81);//极客之选
//    ids.add(250);//极客出行
//    ids.add(85);//产品观察
//    ids.add(12);//极客现场
//    ids.add(179);//综合报道
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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (listData == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      Widget listview = new ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, i) => buildItem(i),
        controller: _controller,
      );
      return new RefreshIndicator(child: listview, onRefresh: _pullToRefresh);
    }
  }

  Widget buildItem(int i) {
    return new PostItemPage(listData[i],widget.title);
  }

  Future<Null> _pullToRefresh() {
    currentPage = 1;
    getPost();
    return null;
  }

  void getPost() {
    String url = Api.ARTICLE_LIST;
    var id = ids[widget.columnId];
    url += id.toString()+"?page=$currentPage";
    HttpUtil.get(url, (data) {
      if (data != null) {
        var _listData = data['column'];
        setState(() {
          List list = new List();
          if (currentPage == 0) {
            listData.clear();
          }
          currentPage++;
          list.addAll(listData);
          list.addAll(_listData['posts']);
          listData = list;

        });
      }
    });
  }
}
