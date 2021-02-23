import 'package:BookShare/constants.dart';
import 'package:flutter/material.dart';

Widget myTextField(
    {String text = "",
    bool obscureText = false,
    Function(String) onChanged,
    double width = 250,
    double height = 70}) {
  return Container(
    width: width,
    height: height,
    child: TextField(
      decoration: InputDecoration(
        hintText: text,
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
      autocorrect: false,
      obscureText: obscureText,
      onChanged: onChanged,
    ),
  );
}

Widget myButton({
  String text = "",
  Color color,
  Function onPressed,
  double width = 250,
}) {
  return Container(
    width: width,
    height: 50,
    child: Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(32),
      color: color,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

myDialog(BuildContext context, String text) {
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
      ),
      contentPadding: EdgeInsets.only(top: 0),
      content: Container(
        width: 200,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          border: Border.all(color: kGreen, width: 3),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: kOrange,
            fontSize: 18,
          ),
        ),
      ),
    ),
  );
}
