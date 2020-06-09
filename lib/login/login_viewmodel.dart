import 'package:brainsandbeards/login/login_response.dart';
import 'package:brainsandbeards/redux/app_state.dart';
import 'package:brainsandbeards/redux/login/login_actions.dart';
import 'package:redux/redux.dart';

class LoginViewModel {
  final bool isLoading;
  final bool loginError;
  final LoginResponse user;
  final Function(String, String) login;

  LoginViewModel({this.isLoading, this.loginError, this.user, this.login});
  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      isLoading: store.state.loginState.isLoading,
      loginError: store.state.loginState.loginError,
      user: store.state.loginState.user,
      login: (String username,String password){
        store.dispatch(loginUser(username,password));
      }
    );
  }
}
