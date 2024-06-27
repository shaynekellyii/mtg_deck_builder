import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mtg_deck_builder/services/services.dart';

part 'build_deck_store.g.dart';

class BuildDeckStore = _BuildDeckStore with _$BuildDeckStore;

abstract class _BuildDeckStore with Store {
  final _repository = GetIt.I.get<MdbRepository>();

  @observable
  List<String> searchResults = [];

  @action
  void addCard() {}

  @action
  Future<void> searchCards(String query) async {
    // TODO: Error handling
    final response = await _repository.searchCards(query);
    searchResults = response.data.map((card) => card.name).toList();
  }
}
