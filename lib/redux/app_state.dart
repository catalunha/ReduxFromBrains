// import 'package:meta/meta.dart';

import 'package:brainsandbeards/redux/login/login_state.dart';

class AppState {
  final LoginState loginState;

  AppState({this.loginState});
  factory AppState.initial() {
    return AppState(
      loginState: LoginState.initial(),
    );
  }
  AppState copyWith({
    LoginState loginState,
  }) {
    return AppState(
      loginState: loginState ?? this.loginState,
    );
  }
  @override
  int get hashCode => loginState.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && loginState == other.loginState;
}
