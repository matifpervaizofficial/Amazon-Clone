// ignore_for_file: prefer_const_constructors

import 'package:amazonclone/constants/colors.dart';
import 'package:amazonclone/features/auth/screens/authscreen.dart';
import 'package:amazonclone/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Amazon());
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalColors.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalColors.secondaryColor),
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
          ),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: AuthScreen());
  }
}
