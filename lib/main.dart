import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prueba_monja/ui/setup_dialog_ui.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'app.locator.dart';
import 'app.router.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await setupLocator();
    setupDialogUi();

    String initialRoute = Routes.homeView;

    runApp(MyApp(
      initialRoute: initialRoute,
    ));
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Roadmap',
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      onGenerateRoute: StackedRouter().onGenerateRoute,
      initialRoute: initialRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
