class CategoryState {
  final String? newCategory;
  final String? temp;

  CategoryState({ this.newCategory = '', this.temp = '' });

  CategoryState copyWith({ String? newCategory, String? temp  }) {
    return CategoryState(newCategory: newCategory ?? this.newCategory, temp: temp ?? this.temp);
  }
}