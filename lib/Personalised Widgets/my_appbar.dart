import 'package:flutter/material.dart';

class Title {
  final String tittle;
  Title(this.tittle);
}

class MyAppbar {
  final AppBar appBar = AppBar(
    backgroundColor: Colors.black,
    centerTitle: true,
    title: Text(
      'Products',
      textAlign: TextAlign.center,
    ),
  );
}
