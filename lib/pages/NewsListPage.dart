
import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget {
  NewsListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(itemBuilder: null)
    );
  }
}