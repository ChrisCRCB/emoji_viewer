import 'package:json_annotation/json_annotation.dart';

import 'emoticon.dart';

part 'emoticon_group.g.dart';

/// A group of emoticons.
@JsonSerializable()
class EmoticonGroup {
  /// Create an instance.
  const EmoticonGroup({
    required this.group,
    required this.emoticon,
  });

  /// Create an instance from a JSON object.
  factory EmoticonGroup.fromJson(final Map<String, dynamic> json) =>
      _$EmoticonGroupFromJson(json);

  /// The name of this group.
  final String group;

  /// The emoticons in this group.
  final List<Emoticon> emoticon;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$EmoticonGroupToJson(this);
}
