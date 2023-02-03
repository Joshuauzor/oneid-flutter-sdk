import 'package:flutter/material.dart';
import 'package:oneid_sdk_eg/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneID Flutter SDK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginWithOneID(),
    );
  }
}
