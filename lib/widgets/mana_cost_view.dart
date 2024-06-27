import 'package:flutter/widgets.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

const _svgBaseUri = 'https://svgs.scryfall.io/card-symbols/';

///
/// Takes a text mana cost and displays the relevant
/// mana symbols.
///
class ManaCostView extends StatelessWidget {
  const ManaCostView({
    required this.manaCost,
    super.key,
  });

  /// e.g. {4}{G}{G}
  final String manaCost;

  List<String> get svgUris {
    final symbols = manaCost
        .split('}')
        .where((s) => s.isNotEmpty)
        .map((s) => s.replaceAll('{', ''));
    return symbols.map((s) => '$_svgBaseUri$s.svg').toList();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: svgUris
          .map((uri) => Image(image: Svg(uri, source: SvgSource.network)))
          .expand((l) => [l, const SizedBox(width: 2.0)])
          .toList(),
    );
  }
}
