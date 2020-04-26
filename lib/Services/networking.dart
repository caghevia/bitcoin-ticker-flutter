import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelpe {
  NetworkHelpe(this.url, this.header);
  final String url;
  final Map<String, String> header;

  Future getData() async {
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
