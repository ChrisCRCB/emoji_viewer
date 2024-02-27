// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emoji.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Emoji _$EmojiFromJson(Map<String, dynamic> json) => Emoji(
      base: (json['base'] as List<dynamic>).map((e) => e as int).toList(),
      alternates: (json['alternates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as int).toList())
          .toList(),
      emoticons:
          (json['emoticons'] as List<dynamic>).map((e) => e as String).toList(),
      shortcodes: (json['shortcodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      animated: json['animated'] as bool? ?? false,
      directional: json['directional'] as bool? ?? false,
    );

Map<String, dynamic> _$EmojiToJson(Emoji instance) => <String, dynamic>{
      'base': instance.base,
      'alternates': instance.alternates,
      'emoticons': instance.emoticons,
      'shortcodes': instance.shortcodes,
      'animated': instance.animated,
      'directional': instance.directional,
    };
