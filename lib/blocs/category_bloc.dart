import 'package:bloc_two/events/category_event.dart';
import 'package:bloc_two/states/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  CategoryBloc(): super(CategoryState());
  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {

    if (event is CategoryChanged) {
      yield state.copyWith(temp: event.newCategory);
    }

    if (event is UpdateCategory) {
      print('updating category');
      yield state.copyWith(currentCategory: state.temp);
    }
  }
}