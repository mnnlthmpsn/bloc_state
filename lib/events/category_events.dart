abstract class CategoryEvent {}

class CategoryChanged extends CategoryEvent {
  final String newCategory;

  CategoryChanged({ required this.newCategory });
}

class UpdateCategory extends CategoryEvent {}