import 'package:BookShare/common.dart';
import 'package:BookShare/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class RegisterPage extends StatefulWidget {
  Function refresh;
  RegisterPage({Key key, this.refresh}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: register(),
    );
  }

  Scaffold register() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: kGreen,
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
                height: 150,
                child: Image.asset(
                  "assets/register.png",
                  fit: BoxFit.contain,
                ),
              ),
              Container(height: 20),
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

              // 3.5
              myTextField(
                text: "Email",
                onChanged: (value) => kEmail = value,
              ),
              // 4
              myButton(
                text: "Create a New Account",
                color: kOrange,
                onPressed: () => register_DB(),
              ),
              // 5
              Container(height: 20),
              myButton(
                text: "Cancel",
                color: kGreen,
                onPressed: () {
                  kPage = "Login";
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

  Future<List> register_DB() async {
    if (kUsername == "" || kPassword == "" || kEmail == "") {
      myDialog(context, "Fill all the fields");
      return null;
    }
    final response =
        await http.post("http://aldha.dev/BookShare/register.php", body: {
      "username": kUsername,
      "password": kPassword,
      "email": kEmail,
    });

    print(response.body);
    if (response.body == kUsername) {
      kPage = "Login";
      kUsername = "";
      kPassword = "";
      kEmail = "";
      widget.refresh();
      myDialog(context, "User Created Successfully");
    } else {
      myDialog(context, response.body);
    }
  }
}
