import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// Project imports:

class RootPageViewModel extends ReactiveViewModel {
  // final _sessionService = locator<SessionService>();
  // final _commonService = locator<CommonVariableService>();

  // newActivity() {
  //   _sessionService.userActivityDetected(_commonService.timeOutMinutes);
  // }

  void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];
}
