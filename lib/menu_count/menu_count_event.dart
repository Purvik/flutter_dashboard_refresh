import 'package:equatable/equatable.dart';

abstract class MenuCountEvent extends Equatable {
  const MenuCountEvent();

  @override
  List<Object> get props => [];
}

class GetMenuCount extends MenuCountEvent {}
