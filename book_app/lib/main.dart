import 'package:flutter/material.dart';

import 'app/home/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      theme: ThemeData(
        primarySwatch:Colors.blueGrey
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
