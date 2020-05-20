import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_refresh_demo/menu_count/menu_count_bloc.dart';
import 'package:flutter_refresh_demo/menu_count/menu_count_event.dart';
import 'package:flutter_refresh_demo/menu_count/menu_count_state.dart';

class MenuCountPage extends StatefulWidget {
  final String menuLabel;

  MenuCountPage({@required this.menuLabel});

  @override
  _MenuCountPageState createState() => _MenuCountPageState();
}

class _MenuCountPageState extends State<MenuCountPage> {
  MenuCountBloc _menuCountBloc;

  @override
  void initState() {
    super.initState();
    _menuCountBloc = BlocProvider.of<MenuCountBloc>(context);
    _menuCountBloc.add(GetMenuCount(menuLabel: widget.menuLabel));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MenuCountBloc, MenuCountState>(
        builder: (context, state) {
          if (state is MenuCountSuccess) {
            return Text(
              '${state.count}',
              style: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white,
                  ),
            );
          }
          if (state is MenuCountFail) {
            return Text(
              '0',
              style: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white,
                  ),
            );
          }
          return Center(
            child: SizedBox(
              height: 15.0,
              width: 15.0,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                backgroundColor: Colors.white60,
              ),
            ),
          );
        },
      ),
    );
  }
}
