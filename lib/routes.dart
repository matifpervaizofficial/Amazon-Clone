import 'package:amazonclone/features/auth/screens/authscreen.dart';
import 'package:flutter/material.dart';

// generateRoute is a function that will use for generate routes
Route<dynamic> generateRoute(RouteSettings routeSettings) {
// RouteSettings give us any data that is useful for constructing a routes
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
                body: Text("no data to show"),
              ));
  }
}
