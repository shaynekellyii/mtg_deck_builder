// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'build_deck_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BuildDeckStore on _BuildDeckStore, Store {
  late final _$searchResultsAtom =
      Atom(name: '_BuildDeckStore.searchResults', context: context);

  @override
  List<String> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(List<String> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
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
  void addCard() {
    final _$actionInfo = _$_BuildDeckStoreActionController.startAction(
        name: '_BuildDeckStore.addCard');
    try {
      return super.addCard();
    } finally {
      _$_BuildDeckStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchResults: ${searchResults}
    ''';
  }
}
