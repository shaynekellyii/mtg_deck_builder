import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtg_deck_builder/widgets/widgets.dart';
import 'package:scryfall_api/scryfall_api.dart';

class CardTextView extends StatelessWidget {
  const CardTextView({
    required this.card,
    required this.qty,
    super.key,
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
        SizedBox(
          height: 15.0,
          child: ManaCostView(manaCost: card.manaCost ?? ''),
        ),
        const SizedBox(width: 10.0),
        Text(
          card.prices.usd != null ? '\$${card.prices.usd}' : '',
          style: GoogleFonts.robotoMono(),
        ),
      ],
    );
  }
}
