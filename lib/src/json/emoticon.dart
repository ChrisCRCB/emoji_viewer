import 'package:json_annotation/json_annotation.dart';

part 'emoticon.g.dart';

/// An old-style emoticon.
@JsonSerializable()
class Emoticon {
  /// Create an instance.
  const Emoticon({
    required this.value,
    required this.description,
  });

  /// Create an instance from a JSON object.
  factory Emoticon.fromJson(final Map<String, dynamic> json) =>
      _$EmoticonFromJson(json);

  /// The emoticon to insert.
  final String value;

  /// The description of this emoticon.
  final String description;

  /// Convert an instance to JSON.
  Map<String, dynamic> toJson() => _$EmoticonToJson(this);
}
