import 'package:get_it/get_it.dart';
import 'package:scryfall_api/scryfall_api.dart';

const _scryfallNotFoundCode = 'not_found';

///
/// Manages interactions with the scryfall API and cache.
///
// TODO: Implement caching
class MdbRepository {
  final _scryfall = GetIt.I.get<ScryfallApiClient>();

  Future<PaginableList<MtgCard>> searchCards(String query) async {
    try {
      return await _scryfall.searchCards(query);
    } on ScryfallException catch (e) {
      // handle api throwing exception when no results found...
      if (e.code == _scryfallNotFoundCode) {
        return PaginableList(data: [], hasMore: false);
      }
      rethrow;
    }
  }
}
