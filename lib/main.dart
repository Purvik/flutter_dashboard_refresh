import 'package:flutter/material.dart';
import 'package:flutter_refresh_demo/dashboard/darhboard_home.dart';
import 'package:flutter_refresh_demo/second_screen/second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardHome(),
      routes: {
        SecondScreen.routeName: (context) => SecondScreen(),
      },
    );
  }
}
