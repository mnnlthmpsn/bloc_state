import 'package:dio_bloc/states.dart';
import 'package:dio_bloc/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<FormSubmitted>(_onFormSubmitted);
  }

  // handlers
  void _onUsernameChanged(UsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onFormSubmitted(FormSubmitted event, Emitter<LoginState> emit) {
    if (event.formKey.currentState!.validate()) {
      print("Valid details");
    }
  }
}