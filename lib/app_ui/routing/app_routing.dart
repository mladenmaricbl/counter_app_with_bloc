import 'package:counter_app_with_bloc/app_ui/screens/home_screen.dart';
import 'package:counter_app_with_bloc/app_ui/screens/second_screen.dart';
import 'package:counter_app_with_bloc/app_ui/screens/third_screen.dart';
import 'package:flutter/material.dart';

import 'app_routes.dart';

class AppRouting {
  const AppRouting._();

  static RouteFactory onGenerateAppRoute = (settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(title: 'Counter app', color: Colors.blue),
          transitionDuration: Duration.zero,
        );

      case AppRoutes.secondScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SecondScreen(title: 'Second screen', color: Colors.red),
          transitionDuration: Duration(seconds: 0),
        );

      case AppRoutes.thirdScreen:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => ThirdScreen(title: 'Second screen', color: Colors.yellow),
          transitionDuration: Duration(seconds: 0),
        );

      default:
        throw ArgumentError.value(settings.name, null, 'Unexpected route name.');
    }
  };
}