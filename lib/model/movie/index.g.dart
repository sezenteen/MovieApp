// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      description: json['description'] as String?,
      durationMin: (json['durationMin'] as num?)?.toInt(),
      publishedYear: (json['publishedYear'] as num?)?.toInt(),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imgUrl': instance.imgUrl,
      'publishedYear': instance.publishedYear,
      'durationMin': instance.durationMin,
      'type': instance.type,
      'description': instance.description,
    };
