import 'package:flutter/material.dart';
import 'package:mtg_deck_builder/features/build_deck/build_deck_store.dart';

class BuildDeckScreen extends StatelessWidget {
  BuildDeckScreen({
    BuildDeckStore? store,
    super.key,
  }) : store = store ?? BuildDeckStore();

  final BuildDeckStore store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Deck Title',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const _Tags(),
              ],
            ),
            const SizedBox(height: 20.0),
            _SearchBar(store: store),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    required this.store,
  });

  final BuildDeckStore store;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: const Icon(Icons.search),
      elevation: const WidgetStatePropertyAll(0.0),
      onChanged: store.searchCards,
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags();

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        'COMMANDER / EDH',
        style: Theme.of(context).textTheme.labelSmall,
      ),
      labelPadding: EdgeInsets.zero,
    );
  }
}
