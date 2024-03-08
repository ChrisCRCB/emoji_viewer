import 'package:backstreets_widgets/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'src/widgets/tabs/emoji_tab.dart';
import 'src/widgets/tabs/emoticons_tab.dart';

void main() {
  runApp(const MyApp());
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) => MaterialApp(
        title: 'Emoji Viewer',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Builder(
          builder: (final context) {
            RendererBinding.instance.ensureSemantics();
            return TabbedScaffold(
              tabs: [
                TabbedScaffoldTab(
                  title: 'Emoji',
                  icon: const Text('Modern emoji'),
                  builder: (final context) => const EmojiTab(),
                ),
                TabbedScaffoldTab(
                  title: 'Emoticons',
                  icon: const Text('Classic MSN-style emoticons'),
                  builder: (final context) => const EmoticonsTab(),
                ),
              ],
            );
          },
        ),
      );
}
