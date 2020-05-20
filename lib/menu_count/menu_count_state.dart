import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MenuCountState extends Equatable {
  const MenuCountState();

  @override
  List<Object> get props => [];
}

class MenuCountInitial extends MenuCountState {}

class MenuCountLoading extends MenuCountState {}

class MenuCountSuccess extends MenuCountState {
  final int count;

  MenuCountSuccess({@required this.count});

  @override
  List<Object> get props => [count];
}

class MenuCountFail extends MenuCountState {}
