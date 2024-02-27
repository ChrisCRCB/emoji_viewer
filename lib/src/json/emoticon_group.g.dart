// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoticon_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmoticonGroup _$EmoticonGroupFromJson(Map<String, dynamic> json) =>
    EmoticonGroup(
      group: json['group'] as String,
      emoticon: (json['emoticon'] as List<dynamic>)
          .map((e) => Emoticon.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmoticonGroupToJson(EmoticonGroup instance) =>
    <String, dynamic>{
      'group': instance.group,
      'emoticon': instance.emoticon,
    };
