import 'package:flutter/material.dart';
import 'package:flutter_bugs/home_page.dart';
import 'package:flutter_bugs/ioc/container.dart';

void main() {
  configureDependencyInjection(Env.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
