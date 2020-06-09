import 'package:brainsandbeards/redux/app_state.dart';
import 'package:brainsandbeards/redux/login/login_actions.dart';
import 'package:brainsandbeards/redux/login/login_reducer.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, LoginAction>(_loginAction),
]);
AppState _loginAction(AppState state, LoginAction action) {
  return state.copyWith(loginState: loginReducer(state.loginState, action));
}
