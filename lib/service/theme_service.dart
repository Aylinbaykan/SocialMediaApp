import 'package:flutter/material.dart';
import 'package:observable_ish/value/value.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class ThemeService with ReactiveServiceMixin {
  ThemeService() {
    //3
    listenToReactiveValues([
      _isLightMode,
    ]);
  }

  final RxValue<bool> _isLightMode = RxValue(true);

  bool get isLightMode => _isLightMode.value;

  void setLightMode(bool value, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('theme', value);
    _isLightMode.value = value;

    notifyListeners();
  }

  Future<bool> getFromPreferencesLightMode(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? result = prefs.getBool('theme');
    if (result == null) {
      // ignore: use_build_context_synchronously
      var brightness = MediaQuery.of(context).platformBrightness;
      bool isLightMode = brightness == Brightness.light;
      _isLightMode.value = isLightMode;
      notifyListeners();
      if (isLightMode) {
        return true;
      } else {
        return false;
      }
    }
    _isLightMode.value = isLightMode;
    notifyListeners();
    return result;
  }
}
