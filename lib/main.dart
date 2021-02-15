import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: loadHome(),
    );
  }

  Scaffold loadHome() {
    return Scaffold(
      appBar: AppBar(
        title: Text("BookShare"),
        backgroundColor: Colors.blue,
      ),
      body: Text(
        "Hello World",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
