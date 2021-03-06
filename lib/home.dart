import 'package:BookShare/common.dart';
import 'package:flutter/material.dart';
import 'package:BookShare/constants.dart';

class HomePage extends StatefulWidget {
  Function refresh;
  HomePage({Key key, this.refresh}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: home(),
    );
  }

  Scaffold home() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: kGreen,
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
                child: Text(
                  "Welcome, $kUsername.",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              // 2
              myButton(
                text: "Look for a Book",
                color: kGreen,
                onPressed: () {},
              ),
              Container(height: 20),
              // 3
              myButton(
                text: "Add a Book",
                color: kOrange,
                onPressed: () {
                  kPage = "AddABook";
                  widget.refresh();
                },
              ),
              Container(height: 20),
              // 4
              myButton(
                text: "Messages",
                color: kGreen,
                onPressed: () {},
              ),
              Container(height: 20),
              // 5
              myButton(
                text: "Logout",
                color: Colors.grey,
                onPressed: () {
                  kUsername = "";
                  kPage = "Login";
                  widget.refresh();
                },
              ),
              // end
            ],
          ),
        ));
  }
}
