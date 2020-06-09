import 'package:brainsandbeards/redux/app_reducer.dart';
import 'package:brainsandbeards/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

final Store<AppState> store = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [thunkMiddleware]
);