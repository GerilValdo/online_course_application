import 'package:flutter/material.dart';

import './screen/start_page.dart';
import './screen/register_page.dart';
import './screen/log_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreen[400],
          toolbarHeight: 180,
          centerTitle: true,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            // letterSpacing: 6,
          ),
        ),
      ),
      routes: {
        RegisterPage.routeName: (context) => const RegisterPage(),
        LogInPage.routeName: (context) => const LogInPage(),
      },
    );
  }
}
