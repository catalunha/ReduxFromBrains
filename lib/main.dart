import 'package:brainsandbeards/home/home_screen.dart';
import 'package:brainsandbeards/login/login_screen.dart';
import 'package:brainsandbeards/redux/app_store.dart';
import 'package:brainsandbeards/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo - Redux',
        navigatorKey: Keys.navKey,
        theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(title: 'Log in'),
        routes: {
          Routes.homeScreen: (context) {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
