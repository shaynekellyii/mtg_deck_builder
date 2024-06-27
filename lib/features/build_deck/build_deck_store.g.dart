// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_deck_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuildDeckStore on _BuildDeckStore, Store {
  late final _$searchResultsStateAtom =
      Atom(name: '_BuildDeckStore.searchResultsState', context: context);

  @override
  ViewState<List<MtgCard>> get searchResultsState {
    _$searchResultsStateAtom.reportRead();
    return super.searchResultsState;
  }

  @override
  set searchResultsState(ViewState<List<MtgCard>> value) {
    _$searchResultsStateAtom.reportWrite(value, super.searchResultsState, () {
      super.searchResultsState = value;
    });
  }

  late final _$cardsInDeckAtom =
      Atom(name: '_BuildDeckStore.cardsInDeck', context: context);

  @override
  ObservableMap<MtgCard, int> get cardsInDeck {
    _$cardsInDeckAtom.reportRead();
    return super.cardsInDeck;
  }

  @override
  set cardsInDeck(ObservableMap<MtgCard, int> value) {
    _$cardsInDeckAtom.reportWrite(value, super.cardsInDeck, () {
      super.cardsInDeck = value;
    });
  }

  late final _$searchQueryAtom =
      Atom(name: '_BuildDeckStore.searchQuery', context: context);

  @override
  String get searchQuery {
    _$searchQueryAtom.reportRead();
    return super.searchQuery;
  }

  @override
  set searchQuery(String value) {
    _$searchQueryAtom.reportWrite(value, super.searchQuery, () {
      super.searchQuery = value;
    });
  }

  late final _$updateSearchQueryAsyncAction =
      AsyncAction('_BuildDeckStore.updateSearchQuery', context: context);

  @override
  Future<void> updateSearchQuery(String query) {
    return _$updateSearchQueryAsyncAction
        .run(() => super.updateSearchQuery(query));
  }

  late final _$searchCardsAsyncAction =
      AsyncAction('_BuildDeckStore.searchCards', context: context);

  @override
  Future<void> searchCards(String query) {
    return _$searchCardsAsyncAction.run(() => super.searchCards(query));
  }

  late final _$_BuildDeckStoreActionController =
      ActionController(name: '_BuildDeckStore', context: context);

  @override
  void addCard(MtgCard card) {
    final _$actionInfo = _$_BuildDeckStoreActionController.startAction(
        name: '_BuildDeckStore.addCard');
    try {
      return super.addCard(card);
    } finally {
      _$_BuildDeckStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchResultsState: ${searchResultsState},
cardsInDeck: ${cardsInDeck},
searchQuery: ${searchQuery}
    ''';
  }
}
