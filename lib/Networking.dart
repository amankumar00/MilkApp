import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  String url = 'https://milkman-api.herokuapp.com/';
  Future getData() async {
    http.Response response = await http.get(url);
    String data = response.body;
    var decode = jsonDecode(data);
    for (var u in decode) {
      print(u['imgURL']);
    }
    return decode;
  }
}
