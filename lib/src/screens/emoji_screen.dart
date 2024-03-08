import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../json/emoji.dart';

/// A screen to show a single [emoji].
class EmojiScreen extends StatelessWidget {
  /// Create an instance.
  const EmojiScreen({
    required this.emoji,
    super.key,
  });

  /// The emoji to use.
  final Emoji emoji;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final alternates = emoji.alternates.map((final e) {
      final string = String.fromCharCodes(e);
      return '$string (${e.join(' + ')})';
    }).toList();
    final base = String.fromCharCodes(emoji.base);
    return Cancel(
      child: SimpleScaffold(
        title: 'Emoji',
        body: ListView(
          shrinkWrap: true,
          children: [
            CopyListTile(
              autofocus: true,
              title: 'Short codes',
              subtitle: emoji.shortcodes.join(' | '),
            ),
            CopyListTile(
              title: 'Base emoji',
              subtitle: '$base (${emoji.base.join(' + ')})',
            ),
            for (var i = 0; i < alternates.length; i++)
              CopyListTile(
                title: 'Alternate ${i + 1}',
                subtitle: alternates[i],
              ),
            CopyListTile(
              title: 'Emoticons',
              subtitle: emoji.emoticons.isEmpty
                  ? 'NONE'
                  : emoji.emoticons.join(' | '),
            ),
            CheckboxListTile(
              value: emoji.animated,
              onChanged: (final _) {},
              title: const Text('Animated'),
            ),
            CheckboxListTile(
              value: emoji.directional,
              onChanged: (final _) {},
              title: const Text('Directional'),
            ),
          ],
        ),
      ),
    );
  }
}
