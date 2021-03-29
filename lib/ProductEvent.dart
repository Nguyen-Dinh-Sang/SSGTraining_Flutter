abstract class ProductEvent {}

class SearchEvent extends ProductEvent {
  final String key;

  SearchEvent(this.key);
}