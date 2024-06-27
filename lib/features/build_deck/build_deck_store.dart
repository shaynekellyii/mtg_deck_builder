import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mtg_deck_builder/models/models.dart';
import 'package:mtg_deck_builder/services/services.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'build_deck_store.g.dart';

class BuildDeckStore = _BuildDeckStore with _$BuildDeckStore;
const _minSearchQueryLength = 3;
const _maxSearchResultsLength = 10;
const _searchDebounceMillis = 300;

abstract class _BuildDeckStore with Store {
  final _repository = GetIt.I.get<MdbRepository>();

  // Observables
  @observable
  ViewState<List<MtgCard>> searchResultsState = const Idle();

  @observable
  ObservableMap<MtgCard, int> cardsInDeck = ObservableMap();

  @observable
  String searchQuery = '';

  // Actions
  @action
  void addCard(MtgCard card) {
    final existingQty = cardsInDeck[card] ?? 0;
    cardsInDeck[card] = existingQty + 1;
  }

  @action
  Future<void> updateSearchQuery(String query) async => searchQuery = query;

  // Reactions
  late List<ReactionDisposer> _disposers;

  void setupReactions() {
    _disposers = [
      reaction((_) => searchQuery, searchCards, delay: _searchDebounceMillis),
      reaction((_) => cardsInDeck, (_) => updateSearchQuery('')),
    ];
  }

  @action
  Future<void> searchCards(String query) async {
    if (query.trim().length < _minSearchQueryLength) {
      searchResultsState = const Success(data: []);
      return;
    }

    searchResultsState = const Loading();
    try {
      final response = await _repository.searchCards(query.trim());
      searchResultsState = Success(
        data: response.data.take(_maxSearchResultsLength).toList(),
      );
    } catch (e, st) {
      searchResultsState = Failed(error: e, stackTrace: st);
    }
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
