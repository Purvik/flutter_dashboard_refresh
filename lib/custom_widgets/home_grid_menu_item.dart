import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_refresh_demo/menu_count/menu_count_page.dart';

import '../menu_count/menu_count_bloc.dart';
import '../menu_count/menu_count_state.dart';

class HomeGridMenuItem extends StatelessWidget {
  final String label;
  final IconData icon;

  HomeGridMenuItem({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        InkWell(
          splashColor: Colors.black26,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.black38,
                  size: 40.0,
                ),
                FittedBox(
                  child: Text(
                    label,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black38,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 5.0,
            ),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0),
                bottomLeft: Radius.circular(5.0),
              ),
            ),
            child: BlocBuilder<MenuCountBloc, MenuCountState>(
              builder: (context, state) {
                if (state is MenuCountFail) {
                  return MenuCountPage(itemCount: 0);
                } else if (state is MenuCountSuccess) {
                  return MenuCountPage(itemCount: state.count);
                }
                return SizedBox(
                  height: 15.0,
                  width: 15.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    backgroundColor: Colors.white60,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
