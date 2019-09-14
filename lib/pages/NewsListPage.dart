import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsListPage extends StatefulWidget {
  NewsListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  ScrollController _scrollController = new ScrollController();

  bool isLoading = false;

  List names = new List();

  final dio = new Dio();

  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

//      final response = await dio.get(nextPage);
//      List tempList = new List();
//      nextPage = response.data['next'];
//      for (int i = 0; i < response.data['results'].length; i++) {
//        tempList.add(response.data['results'][i]);
//      }
//
//      setState(() {
//        isLoading = false;
//        names.addAll(tempList);
//      });
    }
  }

  @override
  void initState() {
    this._getMoreData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new SafeArea(
            child: new Column(

            ))
    );
  }
}