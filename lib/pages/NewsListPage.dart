import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/Constant.dart';

class NewsListPage extends StatefulWidget {
  NewsListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {

  ScrollController _scrollController = new ScrollController();

  String url = Constant.newsDevUrl;

  bool isLoading = false;

  List news = new List();

  final dio = new Dio();

  void _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

//    access to all certificates
      if (Platform.isAndroid) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        };
      }

      final response = await dio.get(url);
      List tempList = new List();
      url = response.data['next'];
      for (int i = 0; i < response.data['results'].length; i++) {
        tempList.add(response.data['results'][i]);
      }

      setState(() {
        isLoading = false;
        news.addAll(tempList);
      });
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

  Widget _buildList() {
    return ListView.builder(
        itemCount: news.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == news.length) {
            return _buildProgressIndicator();
          }
          else {
//            return new ListTile(
//              title: news[index]['title'],
//            );

            return new Card (
              child: new Image.network(
                  Constant.mainDomain + news[index]['image']),

            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: _buildList(),
        )
    );
  }


  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}