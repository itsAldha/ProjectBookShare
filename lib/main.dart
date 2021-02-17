import 'package:flutter/material.dart';
import "login.dart";
import "home.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void changePage(String p) {
    setState(() {
      page = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: loadPage(changePage));
  }
}

String page = "Login";

Scaffold loadPage(Function changePage) {
  if (page == "Login")
    return loginPage(changePage);
  else if (page == "Home") return homePage(changePage);
}
