import 'package:flutter/material.dart';
import 'package:flutter_refresh_demo/custom_widgets/home_grid_menu_item.dart';
import 'package:flutter_refresh_demo/second_screen/second_screen.dart';

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () =>
                Navigator.pushNamed(context, SecondScreen.routeName),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          children: <Widget>[
            HomeGridMenuItem(
              label: "Posts",
              icon: Icons.event_note,
              itemCountExist: true,
              itemCount: 2,
            ),
            HomeGridMenuItem(
              label: "Comments",
              icon: Icons.event_note,
              itemCountExist: true,
              itemCount: 2,
            ),
            HomeGridMenuItem(
              label: "Todos",
              icon: Icons.event_note,
              itemCountExist: true,
              itemCount: 2,
            ),
            HomeGridMenuItem(
              label: "Users",
              icon: Icons.event_note,
              itemCountExist: true,
              itemCount: 2,
            ),
          ],
        ),
      ),
    );
  }
}
