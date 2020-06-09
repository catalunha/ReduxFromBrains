import 'package:brainsandbeards/login/login_response.dart';

class LoginState {
  final bool isLoading;
  final bool loginError;
  final LoginResponse user;
  LoginState({
    this.isLoading,
    this.loginError,
    this.user,
  });
  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      loginError: false,
      user: null,
    );
  }
  LoginState copyWith({
    bool isLoading,
    LoginResponse user,
    bool loginError,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      loginError: loginError ?? this.loginError,
      user: user ?? this.user,
    );
  }

  int get hashCode => isLoading.hashCode ^ user.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          loginError == other.loginError &&
          user == other.user;
}
