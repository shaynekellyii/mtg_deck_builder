import 'package:get_it/get_it.dart';
import 'package:mtg_deck_builder/services/services.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MdbLocator {
  static void setup() {
    final getIt = GetIt.I;
    getIt.registerSingleton<ScryfallApiClient>(
      ScryfallApiClient(),
      dispose: (it) => it.close(),
    );
    getIt.registerSingleton<MdbRepository>(MdbRepository());
  }
}
