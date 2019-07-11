import 'package:dialoglist/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gadidak',
      theme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) => Home(),
      },
    );
  }
}
