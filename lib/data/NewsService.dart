import 'package:flutter/foundation.dart';
import 'package:flutter_app/util/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/data/NewsItem.dart';
import 'dart:async';
import 'dart:convert';

class NewsService {

  int page = 0;

  bool isLoading = false;

  Future<List<NewsItem>> fetchNews(http.Client client, id) async {
    String url = Constant.newsDevUrl;
    final response = await client.get(url);
    return compute(parseNews, response.body);
  }

  List<NewsItem> parseNews(String responseBody) {
    final parsed = json.decode(responseBody);
    return (parsed["items"] as List)
        .map<NewsItem>((json) => new NewsItem.fromJson(json))
        .toList();
  }


}

