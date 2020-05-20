import 'dart:convert' as convert;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_refresh_demo/menu_count/menu_count_event.dart';
import 'package:flutter_refresh_demo/menu_count/menu_count_state.dart';
import 'package:http/http.dart' as http;

class MenuCountBloc extends Bloc<MenuCountEvent, MenuCountState> {
  @override
  MenuCountState get initialState => MenuCountInitial();

  @override
  Stream<MenuCountState> mapEventToState(MenuCountEvent event) async* {
    if (event is GetMenuCount) {
      yield MenuCountLoading();
      if (event.menuLabel.length > 0) {
        String mainUrl = "https://jsonplaceholder.typicode.com/";
        String endPoint = event.menuLabel.toLowerCase();
        //make an API call
        var response = await http.get(mainUrl + endPoint);
        if (response.statusCode == 200) {
          var jsonResponse = convert.jsonDecode(response.body);
          var itemCount = jsonResponse.length;
          print('Number of books about http: $itemCount.');
          yield MenuCountSuccess(count: itemCount);
        } else {
          yield MenuCountFail();
          print('Request failed with status: ${response.statusCode}.');
        }
      }
    }
  }
}
