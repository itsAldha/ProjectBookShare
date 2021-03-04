import 'package:BookShare/common.dart';
import 'package:BookShare/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AddABook extends StatefulWidget {
  Function refresh;
  AddABook({Key key, this.refresh}) : super(key: key);

  @override
  _AddABookState createState() => _AddABookState();
}

class _AddABookState extends State<AddABook> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: newBook(),
    );
  }

  Scaffold newBook() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a Book"),
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
                height: 130,
                child: Image.asset(
                  "assets/addABook.png",
                  fit: BoxFit.contain,
                ),
              ),
              // 2
              myTextField(
                text: "Class ID",
                height: 60,
                onChanged: (value) => kClassID = value,
              ),
              // 3
              myTextField(
                text: "Book Title",
                height: 60,
                onChanged: (value) => kBookTitle = value,
              ),
              // 4
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myTextField(
                    text: "Price",
                    height: 60,
                    width: 100,
                    onChanged: (value) => kPrice = value,
                  ),
                  Container(
                    width: 10,
                  ),
                  myButton(
                    text: "Upload Photo",
                    width: 140,
                    color: kOrange,
                    onPressed: () {},
                  ),
                ],
              ),
              // 5
              myTextField(
                text: "Notes",
                height: 120,
                lines: 5,
                onChanged: (value) => kNotes = value,
              ),
              // 4
              myButton(
                text: "Add a new Book",
                color: kOrange,
                onPressed: () => newBook_DB(),
              ),
              // 5
              Container(height: 10),
              myButton(
                text: "Cancel",
                color: kGreen,
                onPressed: () {
                  kPage = "Home";
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

  Future<List> newBook_DB() async {
    // TODO LATER
    return null;

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
