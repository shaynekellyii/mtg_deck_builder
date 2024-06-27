import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtg_deck_builder/features/build_deck/build_deck_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mtg_deck_builder/models/models.dart';
import 'package:scryfall_api/scryfall_api.dart';

class BuildDeckScreen extends StatefulWidget {
  const BuildDeckScreen({super.key});

  @override
  State<BuildDeckScreen> createState() => _BuildDeckScreenState();
}

class _BuildDeckScreenState extends State<BuildDeckScreen> {
  final store = BuildDeckStore();

  @override
  void initState() {
    super.initState();
    store.setupReactions();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
              const SizedBox(height: 20.0),
              _AddCardView(store: store),
              const SizedBox(height: 20.0),
              _DeckView(store: store),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeckView extends StatelessWidget {
  const _DeckView({
    required this.store,
  });

  final BuildDeckStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final cardsWithQty = store.cardsInDeck.entries.toList()
          ..sort((a, b) => a.key.name.compareTo(b.key.name));
        return Column(
          children: [
            Text(
              'Cards (${store.cardsInDeck.length})',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            ...cardsWithQty.map(
              (cardEntry) => _CardTextView(
                card: cardEntry.key,
                qty: cardEntry.value,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CardTextView extends StatelessWidget {
  const _CardTextView({
    required this.card,
    required this.qty,
  });

  final MtgCard card;
  final int qty;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(qty.toString(), style: GoogleFonts.robotoMono()),
        const SizedBox(width: 5.0),
        Text(card.name),
        const Spacer(),
        Text(
          'MV ${card.cmc}',
          style: GoogleFonts.robotoMono(),
        ),
      ],
    );
  }
}

class _AddCardView extends StatelessWidget {
  const _AddCardView({
    required this.store,
  });

  final BuildDeckStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => switch (store.searchResultsState) {
        Idle() => const SizedBox.shrink(),
        Loading() => const CircularProgressIndicator.adaptive(),
        Failed(error: final e, stackTrace: final _) =>
          Text('Error loading search results: $e'),
        Success(data: final cards) =>
          _SearchResultsView(cards: cards, store: store),
      },
    );
  }
}

class _SearchResultsView extends StatelessWidget {
  const _SearchResultsView({
    required this.cards,
    required this.store,
  });

  final List<MtgCard> cards;
  final BuildDeckStore store;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: cards
          .map(
            (c) => ListTile(
              title: Text(c.name),
              minVerticalPadding: 0.0,
              tileColor: Colors.grey[200],
              leading: const Icon(Icons.add),
              onTap: () => store.addCard(c),
            ),
          )
          .expand((l) => [l, const SizedBox(height: 5.0)])
          .toList(),
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
      onChanged: store.updateSearchQuery,
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
