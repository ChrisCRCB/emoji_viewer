import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/util.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../json/emoji_group.dart';
import 'emoji_screen.dart';

/// A screen to show an [emojiGroup].
class EmojiGroupScreen extends StatelessWidget {
  /// Create an instance.
  const EmojiGroupScreen({
    required this.emojiGroup,
    super.key,
  });

  /// The emoji group to show.
  final EmojiGroup emojiGroup;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Cancel(
        child: SimpleScaffold(
          title: emojiGroup.group,
          body: BuiltSearchableListView(
            items: emojiGroup.emoji,
            builder: (final context, final index) {
              final emoji = emojiGroup.emoji[index];
              return SearchableListTile(
                searchString: emoji.shortcodes.join(),
                child: ListTile(
                  autofocus: index == 0,
                  title: Text(emoji.shortcodes.join(' | ')),
                  subtitle: Text(String.fromCharCodes(emoji.base)),
                  onTap: () => pushWidget(
                    context: context,
                    builder: (final context) => EmojiScreen(emoji: emoji),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
