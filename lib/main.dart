import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
//import 'package:socialwall/UI/Wall/socialwall_view.dart';
import 'package:socialmedia/service/theme_service.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'UI/Wall/socialwall_view_model.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

void main() async {
  //test
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(environment: Environment.dev);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  //final sharedService = locator<SecureStorageService>();
  //sharedService.initialize();
  //await initLoging();
  runApp(
    MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      initialRoute: Routes.mainClass,
      showSemanticsDebugger: false,
      title: "Social Media",
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
      localizationsDelegates: const [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', ''),
      ],
    ),
  );
}

//
class MainClass extends StatelessWidget {
  const MainClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainCLassViewModel>.reactive(
      onModelReady: (model) => model.onMOdalReady(context: context),
      viewModelBuilder: () => MainCLassViewModel(),
      // ignore: prefer_const_constructors
      builder: (context, model, child) => Scaffold(),
    );
  }
}

class MainCLassViewModel extends ReactiveViewModel {
  final _themeService = locator<ThemeService>();
  final _navigationService = locator<NavigationService>();

  onMOdalReady({required BuildContext context}) async {
    await _themeService.getFromPreferencesLightMode(context);
    // ignore: use_build_context_synchronously
    //Navigator.pop(context);
    _navigationService.navigateTo(Routes.socialmediaView);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_themeService];
}
