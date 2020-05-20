import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  static const String routeName = 'second-screen';
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'Second Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
