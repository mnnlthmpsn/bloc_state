import 'package:bloc_two/blocs/category_bloc.dart';
import 'package:bloc_two/states/category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (BuildContext context, CategoryState state) {
            return Text(state.newCategory!);
          },
        )
      ),
    );
  }
}
