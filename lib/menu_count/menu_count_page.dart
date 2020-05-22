import 'package:flutter/material.dart';

class MenuCountPage extends StatelessWidget {
  final int itemCount;

  const MenuCountPage({Key key, @required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$itemCount',
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}
