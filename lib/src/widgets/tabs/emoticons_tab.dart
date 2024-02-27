import 'dart:convert';

import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../json/emoticon_group.dart';

/// The tab for showing emoticons.
class EmoticonsTab extends StatelessWidget {
  /// Create an instance.
  const EmoticonsTab({
    super.key,
  });

  /// Build the widget.
  @override
  Widget build(final BuildContext context) {
    final future = getEmoticons(context);
    return SimpleFutureBuilder<List<EmoticonGroup>>(
      future: future,
      done: (final innerContext, final groups) => BuiltSearchableListView(
        items: groups!,
        builder: (final searchableListViewContext, final index) {
          final group = groups[index];
          return SearchableListTile(
            searchString: group.group,
            child: ListTile(
              autofocus: index == 0,
              title: Text(group.group),
              subtitle: Text(group.emoticon.length.toString()),
              onTap: () {},
            ),
          );
        },
      ),
      loading: (final context) => const LoadingWidget(),
      error: ErrorListView.withPositional,
    );
  }

  /// Get the emoticons.
  Future<List<EmoticonGroup>> getEmoticons(final BuildContext context) async {
    final bundle = DefaultAssetBundle.of(context);
    final key = Assets.emojiMetadata.emoticonOrdering;
    final string = await bundle.loadString(key);
    final json = jsonDecode(string) as List<dynamic>;
    return json
        .map(
          (final e) => EmoticonGroup.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
