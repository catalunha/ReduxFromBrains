import 'package:brainsandbeards/redux/login/login_actions.dart';
import 'package:brainsandbeards/redux/login/login_state.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginState>([
  TypedReducer<LoginState, LoginSucessAction>(_loginSucessAction),
  TypedReducer<LoginState, LoginFailedAction>(_loginFailedAction),
  TypedReducer<LoginState, StartLoadingAction>(_startLoginAction),
]);
LoginState _loginSucessAction(LoginState state, LoginSucessAction action) {
  return state.copyWith(
    isLoading: false,
    user: action.user,
    loginError: false,
  );
}

LoginState _loginFailedAction(LoginState state, LoginFailedAction action) {
  return state.copyWith(
    isLoading: false,
    user: null,
    loginError: true,
  );
}

LoginState _startLoginAction(LoginState state, StartLoadingAction action) {
  return state.copyWith(
    isLoading: true,
    user: null,
    loginError: false,
  );
}
