import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UsernameChanged extends LoginEvent {
  final String username;

  const UsernameChanged({ required this.username });

  @override
  List<Object> get props => [username];
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged({ required this.password });

  final String password;

  @override
  List<Object> get props => [password];

}

class FormSubmitted extends LoginEvent {

  const FormSubmitted({ required this.formKey });

  final GlobalKey<FormState> formKey;

  @override
  List<Object> get props => [formKey];
}