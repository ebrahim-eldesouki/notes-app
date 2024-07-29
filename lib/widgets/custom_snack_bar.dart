
  import 'package:flutter/material.dart';

SnackBar customSnackBar() {
    return const SnackBar(
  content: Row(
    children: [
      Icon(
        Icons.thumb_up,
        size: 30,
        color: Colors.white,
      ),
      SizedBox(
        width: 30,
      ),
      Text(
        ' added successfully ',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ],
  ),
  duration: Duration(seconds: 3),
  backgroundColor: Colors.black,
);
  }