import 'package:flutter/material.dart';
import 'login.dart';

Scaffold homePage(Function changePage) {
  return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            // 1
            Container(
              width: 200,
              height: 100,
              alignment: Alignment.center,
              child: Text("Welcome, $username"),
            ),
            // 2
            Container(
              width: 100,
              height: 50,
              child: RaisedButton(
                child: Text("Logout"),
                onPressed: () {
                  username = "";
                  password = "";
                  changePage("Login");
                },
              ),
            ),
            // 3
            // end
          ],
        ),
      ));
}
