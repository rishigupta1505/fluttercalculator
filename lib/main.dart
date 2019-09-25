import 'package:flutter/material.dart';
import 'package:calculator/homepage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title:"Calculator App",
      theme:ThemeData(primarySwatch: Colors.red),
      home:Homepage()

    );
  }

}