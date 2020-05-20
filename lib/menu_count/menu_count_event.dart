import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MenuCountEvent extends Equatable {
  const MenuCountEvent();
}

class GetMenuCount extends MenuCountEvent {
  final String menuLabel;

  GetMenuCount({@required this.menuLabel});

  @override
  List<Object> get props => [];
}
