import 'package:flutter/material.dart';
import 'package:newsapp/widgets/smartTitle.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleView extends StatelessWidget {
 static String id='articleView';
 final String url;
 ArticleView({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
        title: SmartTitle(),
        elevation: 20,
        centerTitle: true,
      ),
      body: WebView(
       initialUrl:url ,
      ),
    );
  }
}
