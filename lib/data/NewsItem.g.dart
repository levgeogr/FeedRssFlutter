// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NewsItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) {
  return NewsItem(
    json['id'] as int,
    json['title'] as String,
    json['link'] as String,
    json['introText'] as String,
    json['image'] as String,
  )..created = json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String);
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'introText': instance.introText,
      'image': instance.image,
      'created': instance.created?.toIso8601String(),
    };
