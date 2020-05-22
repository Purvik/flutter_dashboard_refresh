import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_refresh_demo/custom_widgets/home_grid_menu_item.dart';
import 'package:flutter_refresh_demo/second_screen/second_screen.dart';

import '../menu_count/menu_count_bloc.dart';
import '../menu_count/menu_count_event.dart';

class DashboardHome extends StatefulWidget {
  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final _postsBloc = MenuCountBloc(label: "Posts")..add(GetMenuCount());
  final _commentsBloc = MenuCountBloc(label: "Comments")..add(GetMenuCount());
  final _todosBloc = MenuCountBloc(label: "Todos")..add(GetMenuCount());
  final _usersBloc = MenuCountBloc(label: "Users")..add(GetMenuCount());

  @override
  void dispose() {
    _postsBloc?.close();
    _commentsBloc?.close();
    _todosBloc?.close();
    _usersBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () async {
              await Navigator.pushNamed(context, SecondScreen.routeName);
              _postsBloc.add(GetMenuCount());
              _commentsBloc.add(GetMenuCount());
              _todosBloc.add(GetMenuCount());
              _usersBloc.add(GetMenuCount());
            },
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
            BlocProvider.value(
              value: _postsBloc,
              child: HomeGridMenuItem(
                label: "Posts",
                icon: Icons.event_note,
              ),
            ),
            BlocProvider.value(
              value: _commentsBloc,
              child: HomeGridMenuItem(
                label: "Comments",
                icon: Icons.event_note,
              ),
            ),
            BlocProvider.value(
              value: _todosBloc,
              child: HomeGridMenuItem(
                label: "Todos",
                icon: Icons.event_note,
              ),
            ),
            BlocProvider.value(
              value: _usersBloc,
              child: HomeGridMenuItem(
                label: "Users",
                icon: Icons.event_note,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
