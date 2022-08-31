import 'package:dio_bloc/bloc.dart';
import 'package:dio_bloc/events.dart';
import 'package:dio_bloc/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: _loginForm,
          ),
        ),
      ),
    );
  }

  Widget get _loginForm {
    return BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, LoginState state) {
      return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _usernameField(context, state),
            const SizedBox(height: 20),
            _passwordField(context, state),
            const SizedBox(height: 50),
            _loginButton(context),
          ],
        ),
      );
    });
  }

  Widget _usernameField(BuildContext context, LoginState state) {
    return TextFormField(
      decoration: const InputDecoration(hintText: 'Username'),
      validator: (value) => state.validator(value),
      onChanged: (val) =>
          context.read<LoginBloc>().add(UsernameChanged(username: val)),
    );
  }

  Widget _passwordField(BuildContext context, LoginState state) {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: 'Password'),
      validator: (value) => state.validator(value),
      onChanged: (value) =>
          context.read<LoginBloc>().add(PasswordChanged(password: value)),
    );
  }

  Widget _loginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: () => context.read<LoginBloc>().add(FormSubmitted(formKey: formKey)),
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: const Text('Login', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
