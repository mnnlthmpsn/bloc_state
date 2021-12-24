import 'package:bloc_two/events/category_events.dart';
import 'package:bloc_two/states/category_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryState());

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (event is CategoryChanged) {
      yield state.copyWith(temp: event.newCategory);
    }

    if (event is UpdateCategory) {
      yield state.copyWith(newCategory: state.temp);
    }
  }
}
