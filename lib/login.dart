import 'package:BookShare/common.dart';
import 'package:BookShare/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class LoginPage extends StatefulWidget {
  Function refresh;
  LoginPage({Key key, this.refresh}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: login(),
    );
  }

  Scaffold login() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: kOrange,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              // 1
              Container(height: 20),
              SizedBox(
                height: 180,
                child: Image.asset(
                  "assets/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              Container(height: 30),
              // 2
              myTextField(
                text: "Username",
                onChanged: (value) => kUsername = value,
              ),
              // 3
              myTextField(
                text: "Password",
                obscureText: true,
                onChanged: (value) => kPassword = value,
              ),
              // 4
              myButton(
                text: "Login",
                color: kOrange,
                onPressed: () => login_DB(),
              ),
              // 5
              Container(height: 20),
              myButton(
                text: "Create a New Account",
                color: kGreen,
                onPressed: () {
                  kPage = "Register";
                  widget.refresh();
                },
              ),
              // end
            ],
          ),
        ),
      ),
    );
  }

  Future<List> login_DB() async {
    if (kUsername == "" || kPassword == "") {
      myDialog(context, "Fill all the fields");
      return null;
    }
    final response =
        await http.post("http://aldha.dev/BookShare/login.php", body: {
      "username": kUsername,
      "password": kPassword,
    });

    print(response.body);
    if (response.body == kUsername) {
      kPage = "Home";
      kPassword = "";
      widget.refresh();
    } else {
      myDialog(context, response.body);
    }
  }
}
