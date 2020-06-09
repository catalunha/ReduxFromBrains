import 'package:brainsandbeards/login/error_dialog.dart';
import 'package:brainsandbeards/login/login_input_form.dart';
import 'package:brainsandbeards/login/login_viewmodel.dart';
import 'package:brainsandbeards/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;
  LoginViewModel viewModel;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  loginUser(String username, String password) {
    widget.viewModel.login(username, password);
  }

  Widget getLoadingIndicator(LoginViewModel viewModel) {
    if (viewModel.isLoading) {
      return CircularProgressIndicator();
    }
    return Container();
  }

  showLoginError() {
    showDialog(
        context: context, builder: (BuildContext context) => ErrorDialog());
  }

  Widget buildContent(LoginViewModel viewModel) {
    widget.viewModel = viewModel;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 150.0),
            child:
                Image.asset("assets/images/logo.png", width: 300, height: 150),
          ),
          getLoadingIndicator(viewModel),
          LoginInputForm(onLoginValidationSuccess: loginUser),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StoreConnector<AppState, LoginViewModel>(
          converter: (store) => LoginViewModel.fromStore(store),
          builder: (_, viewModel) => buildContent(viewModel),
          onDidChange: (viewModel) {
            if (viewModel.loginError) {
              showLoginError();
            }
          },
        ),
      ),
    );
  }
}
