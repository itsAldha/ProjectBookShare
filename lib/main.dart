import 'package:BookShare/constants.dart';
import 'package:BookShare/register.dart';
import 'package:flutter/material.dart';
import "login.dart";
import "home.dart";
import "addABook.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: loadPage());
  }

  Widget loadPage() {
    if (kPage == "Login")
      return LoginPage(refresh: refresh);
    else if (kPage == "Home")
      return HomePage(refresh: refresh);
    else if (kPage == "Register")
      return RegisterPage(refresh: refresh);
    else if (kPage == "AddABook") return AddABook(refresh: refresh);
  }
}
