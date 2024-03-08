import 'dart:convert';

import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../json/emoji_group.dart';
import '../../screens/emoji_group_screen.dart';

/// The emoji tab.
class EmojiTab extends StatelessWidget {
  /// Create an instance.
  const EmojiTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final future = getEmoji(context);
    return SimpleFutureBuilder<List<EmojiGroup>>(
      future: future,
      done: (final context, final groups) => BuiltSearchableListView(
        items: groups!,
        builder: (final context, final index) {
          final group = groups[index];
          return SearchableListTile(
            searchString: [
              group.group,
              ...group.emoji.map(
                (final e) => [
                  String.fromCharCodes(e.base),
                  ...e.emoticons,
                  ...e.shortcodes,
                ].join(),
              ),
            ].join(),
            child: ListTile(
              autofocus: index == 0,
              title: Text(group.group),
              subtitle: Text(group.emoji.length.toString()),
              onTap: () => pushWidget(
                context: context,
                builder: (final context) => EmojiGroupScreen(emojiGroup: group),
              ),
            ),
          );
        },
      ),
      loading: (final context) => const LoadingWidget(),
      error: ErrorListView.withPositional,
    );
  }

  /// Get the emoticons.
  Future<List<EmojiGroup>> getEmoji(final BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final string = await bundle.loadString(Assets.emoji151Ordering);
    final json = jsonDecode(string) as List<dynamic>;
    return json
        .map(
          (final e) => EmojiGroup.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
