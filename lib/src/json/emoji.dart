import 'package:json_annotation/json_annotation.dart';

part 'emoji.g.dart';

/// A single emoji.
@JsonSerializable()
class Emoji {
  /// Create an instance.
  const Emoji({
    required this.base,
    required this.alternates,
    required this.emoticons,
    required this.shortcodes,
    this.animated = false,
    this.directional = false,
  });

  /// Create an instance from a JSON object.
  factory Emoji.fromJson(final Map<String, dynamic> json) =>
      _$EmojiFromJson(json);

  /// This is the codepoint sequence for the emoji that should show in the
  /// grid Generally the base is the most neutral version available, such
  /// as the genderless gold skintone version.
  final List<int> base;

  /// These are alternate versions, typically shown as a long-press flyout
  final List<List<int>> alternates;

  /// Emoticon(s)
  final List<String> emoticons;

  /// Shortcode(s)
  final List<String> shortcodes;

  /// Whether there is an animated version for the [base] emoji
  final bool animated;

  /// (15.1): whether the [alternates] include directional emoji
  final bool directional;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$EmojiToJson(this);
}
