import 'package:backstreets_widgets/screens.dart';
import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../json/emoticon_group.dart';

/// A screen for viewing a [emoticonGroup].
class EmoticonGroupScreen extends StatelessWidget {
  /// Create an instance.
  const EmoticonGroupScreen({
    required this.emoticonGroup,
    super.key,
  });

  /// The emoticon group to show.
  final EmoticonGroup emoticonGroup;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => Cancel(
        child: SimpleScaffold(
          title: emoticonGroup.group,
          body: BuiltSearchableListView(
            items: emoticonGroup.emoticon,
            builder: (final context, final index) {
              final emoticon = emoticonGroup.emoticon[index];
              return SearchableListTile(
                searchString: '${emoticon.value}${emoticon.description}',
                child: CopyListTile(
                  autofocus: index == 0,
                  title: emoticon.description,
                  subtitle: emoticon.value,
                ),
              );
            },
          ),
        ),
      );
}
