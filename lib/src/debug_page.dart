import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/src/common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(currentAppThemeNotifierProvider).value ==
        CurrentAppTheme.dark;
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Effacer les téléchargements'),
            onTap: () {
              ref.read(downloadsNotifierProvider.notifier).clearBooks();
            },
          ),
          ListTile(
            title: const Text('Effacer les favoris'),
            onTap: () {
              ref.read(favoritesNotifierProvider.notifier).clearBooks();
            },
          ),
          ListTile(
            title: Text('Changer le thème en ${isDarkMode ? 'Jour' : 'Nuit'}'),
            onTap: () {
              ref
                  .read(currentAppThemeNotifierProvider.notifier)
                  .updateCurrentAppTheme(!isDarkMode);
            },
          ),
        ],
      ),
    );
  }
}
