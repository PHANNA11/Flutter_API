import 'dart:convert';

import 'package:flutter_api/models/post_model.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var respon = await client.get(uri);
    if (respon.statusCode == 200) {
      var json = respon.body;
      return postFromJson(json);
    }
  }
}
