import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String username;
  final String password;

  const LoginState({ this.username = "", this.password = ""});

  LoginState copyWith({ String? username, String? password }) {
    return LoginState(username: username ?? this.username, password: password ?? this.password);
  }

  validator(value) {
    if (value == null || value.isEmpty) {
      return '* Required field';
    }
    return null;
  }

  @override
  // TODO: implement props
  List<Object> get props => [username, password];

}