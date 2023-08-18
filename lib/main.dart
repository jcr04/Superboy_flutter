import 'package:flutter/material.dart';
import 'package:superboy/screen/MyHomePage.dart';
// [MermaidChart: bab9ce26-39c1-4fa6-9efd-ff170ce3cb58]

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superboy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Superboy'),
    );
  }
}
