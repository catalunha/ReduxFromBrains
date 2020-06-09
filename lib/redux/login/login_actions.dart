import 'package:brainsandbeards/login/login_response.dart';
import 'package:brainsandbeards/redux/login/login_service.dart';
import 'package:brainsandbeards/routes.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class LoginAction {}

class StartLoadingAction extends LoginAction {
  StartLoadingAction();
}

class LoginSucessAction extends LoginAction {
  final LoginResponse user;
  LoginSucessAction(this.user);
}

class LoginFailedAction extends LoginAction {
  LoginFailedAction();
}

ThunkAction loginUser(String username, String password) {
  return (Store store) async {
    Future(() async {
      store.dispatch(StartLoadingAction());
      login(username, password).then((loginResponse) {
        store.dispatch(LoginSucessAction(loginResponse));
        Keys.navKey.currentState.pushNamed(Routes.homeScreen);
      }, onError: (error) {
        store.dispatch(LoginFailedAction());
      });
    });
  };
}
