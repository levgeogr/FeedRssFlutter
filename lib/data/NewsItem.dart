import 'package:json_annotation/json_annotation.dart';

part 'NewsItem.g.dart';

@JsonSerializable()

class NewsItem {
  NewsItem(this.id, this.title, this.link, this.introText, this.image);

  int id;
  String title;
  String link;
  String introText;
  String image;

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewsItemToJson(this);

}