import 'package:bloc_two/blocs/category_bloc.dart';
import 'package:bloc_two/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (BuildContext context) => CategoryBloc(),
      child: HomeScreen(),
    ),
  ));
}
