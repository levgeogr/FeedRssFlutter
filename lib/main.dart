import 'package:flutter/material.dart';
import 'package:flutter_app/pages/NewsListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewsListPage(title: 'SevSU News'),
    );
  }
}
