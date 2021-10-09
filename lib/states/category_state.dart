class CategoryState {
  final String? currentCategory;
  final String? temp;

  CategoryState({this.currentCategory = 'Update me', this.temp = ''});

  CategoryState copyWith({String? currentCategory, String? temp}) {
    return CategoryState(
        currentCategory: currentCategory ?? this.currentCategory,
        temp: temp ?? this.temp);
  }
}
