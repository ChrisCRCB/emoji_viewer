// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmojiGroup _$EmojiGroupFromJson(Map<String, dynamic> json) => EmojiGroup(
      group: json['group'] as String,
      emoji: (json['emoji'] as List<dynamic>)
          .map((e) => Emoji.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmojiGroupToJson(EmojiGroup instance) =>
    <String, dynamic>{
      'group': instance.group,
      'emoji': instance.emoji,
    };
