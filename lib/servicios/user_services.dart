import 'dart:convert';

import 'package:http/http.dart' as http;

class UserServices {
  Future getIdeas() async {
    try {
      var url = Uri.parse('https://www.boredapi.com/api/activity');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
