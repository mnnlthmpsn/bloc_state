import 'package:bloc_two/blocs/category_bloc.dart';
import 'package:bloc_two/events/category_event.dart';
import 'package:bloc_two/screens/detail.dart';
import 'package:bloc_two/states/category_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _formWidget());
  }

  Widget _formWidget() {
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
        onChanged: (value) => context
            .read<CategoryBloc>()
            .add(CategoryChanged(newCategory: value)),
        decoration: InputDecoration(border: OutlineInputBorder()),
      );
    });
  }

  Widget _updateButton() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (BuildContext context, CategoryState state) {
        return TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                primary: Colors.white,
                padding: EdgeInsets.all(15)),
            onPressed: () {
              print('initialize update');
              context.read<CategoryBloc>().add(UpdateCategory());
              print('initialization done');
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
            },
            icon: Icon(Icons.update_sharp),
            label: Text('Update Current'));
      },
    );
  }
}
