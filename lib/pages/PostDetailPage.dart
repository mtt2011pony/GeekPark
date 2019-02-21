import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PostDetialPage extends StatefulWidget {
  String title;
  int url;

  PostDetialPage({Key key, @required this.title, @required this.url})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new PostDetialState();
  }
}

class PostDetialState extends State<PostDetialPage> {
  bool isLoad = true;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.onStateChanged.listen((state) {
      if (state.type == WebViewState.finishLoad) {
        setState(() {
          isLoad = false;
        });
      } else if (state.type == WebViewState.startLoad) {
        setState(() {
          isLoad = true;
        });
      }
      ;
    });
  }

  @override
  Widget build(BuildContext context) {
//    return isLoad
//        ? new Center(
//            child: new CircularProgressIndicator(),
//          )
//        :
    return new WebviewScaffold(
      url: "https://www.geekpark.net/news/" + widget.url.toString(),
      appBar: new AppBar(
        title: new Text(widget.title),
        bottom: new PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: isLoad
                ? new LinearProgressIndicator()
                : new Divider(
                    height: 1.0,
                    color: Theme.of(context).primaryColor,
                  )),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
