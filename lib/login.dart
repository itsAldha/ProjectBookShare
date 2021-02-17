import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

String username = "";
String password = "";

Future<List> login_DB(Function changePage) async {
  final response =
      await http.post("http://aldha.dev/BookShare/login.php", body: {
    "username": username,
    "password": password,
  });

  print(response.body);
  if (response.body == username) changePage("Home");
}

void login(Function changePage) {
  if (username == "" || password == "") {
    return;
  }
  login_DB(changePage);
}

Scaffold loginPage(Function changePage) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Login Page"),
      backgroundColor: Colors.blue,
    ),
    body: SingleChildScrollView(
      reverse: true,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            // 1
            Container(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              child: Text("Login Details"),
            ),
            // 2
            Container(
              width: 200,
              height: 80,
              child: TextField(
                decoration: InputDecoration(labelText: "Username"),
                autocorrect: false,
                onChanged: (value) => username = value,
              ),
            ),
            // 3
            Container(
              width: 200,
              height: 80,
              child: TextField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                onChanged: (value) => password = value,
              ),
            ),
            // 4
            Container(
              width: 100,
              height: 40,
              child: RaisedButton(
                child: Text("Login"),
                onPressed: () => login(changePage),
              ),
            ),
            // 5
            // end
          ],
        ),
      ),
    ),
  );
}
