import 'package:json_annotation/json_annotation.dart';

import 'emoji.dart';

part 'emoji_group.g.dart';

/// A group of [emoji].
@JsonSerializable()
class EmojiGroup {
  /// Create an instance.
  const EmojiGroup({
    required this.group,
    required this.emoji,
  });

  /// Create an instance from a JSON object.
  factory EmojiGroup.fromJson(final Map<String, dynamic> json) =>
      _$EmojiGroupFromJson(json);

  /// The name of the group.
  final String group;

  /// THe emoji contained in this group.
  final List<Emoji> emoji;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$EmojiGroupToJson(this);
}
