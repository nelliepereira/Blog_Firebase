import 'package:flutter/material.dart';
import 'package:myblogapp/homepg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(myblogapp());
}

class myblogapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepg()

    );
  }
}

