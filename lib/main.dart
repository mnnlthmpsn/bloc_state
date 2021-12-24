import 'package:bloc_two/blocs/category_bloc.dart';
import 'package:bloc_two/screens/detailScreen.dart';
import 'package:bloc_two/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _categoryBloc = CategoryBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => BlocProvider.value(
          value: _categoryBloc,
          child: HomeScreen(),
        ),
        '/details': (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: _categoryBloc)
            ],
            child: DetailScreen()
        )
      },
    );
  }

  @override
  void dispose() {
    _categoryBloc.close();
    super.dispose();
  }
}
