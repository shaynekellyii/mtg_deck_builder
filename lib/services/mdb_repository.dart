import 'package:get_it/get_it.dart';
import 'package:scryfall_api/scryfall_api.dart';

///
/// Manages interactions with the scryfall API and cache.
///
// TODO: Implement caching
class MdbRepository {
  final _scryfall = GetIt.I.get<ScryfallApiClient>();

  Future<PaginableList<MtgCard>> searchCards(String query) async =>
      await _scryfall.searchCards(query);
}
