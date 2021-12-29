import 'package:flutter/material.dart';
import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(37, 34, 103, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(37, 34, 103, 1),
        ),
      ),
      home: const HomeView(),
    );
  }
}
