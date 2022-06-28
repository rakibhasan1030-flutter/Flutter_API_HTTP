import 'dart:developer';

import 'package:http/http.dart' as http;
import '../helpers/constants.dart';
import '../models/user.dart';

class ApiService {
  Future<List<User>?> getUsers() async {
    List<User> _users = [];
     try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        _users = userFromJson(response.body);
        //return _users;
      }
    } catch (e) {
      log(e.toString());
    }
    return Future.value(_users);
  }
}