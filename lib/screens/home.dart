import 'package:bloc_two/blocs/category_bloc.dart';
import 'package:bloc_two/events/category_events.dart';
import 'package:bloc_two/screens/detailScreen.dart';
import 'package:bloc_two/states/category_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _formWidget(context));
  }

  Widget _formWidget(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 30),
          _currentCategoryField(),
          SizedBox(height: 20),
          _updateButton()
        ],
      ),
    );
  }

  Widget _currentCategoryField() {
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (BuildContext context, CategoryState state) {
          return TextFormField(
            onChanged: (value) => context.read<CategoryBloc>().add(CategoryChanged(newCategory: value)),
            decoration: InputDecoration(border: OutlineInputBorder()),
          );
        }
    );
  }

  Widget _updateButton() {
    return BlocConsumer<CategoryBloc, CategoryState>(
        builder: (BuildContext context, CategoryState state) {
          return TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15)),
            onPressed: () => context.read<CategoryBloc>().add(UpdateCategory()),
            child: Text('Continue'),
          );
        },
        listener: (BuildContext context, CategoryState state) {
          if (state.newCategory == state.temp) {
            Navigator.of(context).pushNamed('/details');
          }
        }
    );
  }
}
