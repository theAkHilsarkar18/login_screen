import 'package:flutter/material.dart';
import 'package:login_screen/home/homescreeen.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Homescreen(),
      },
    ),
  );
}