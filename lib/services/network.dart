import 'dart:convert';

import 'package:http/http.dart' as http;

class Networkhelper {
  final String url;

  Networkhelper( this.url);

  Future getdata() async {
    http.Response res = await http.get(Uri.parse(url));
    print(res);
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
     
    }
  }
}
