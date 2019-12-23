import 'package:flutter/material.dart';
import 'package:get_put_delete/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Put Delete',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
