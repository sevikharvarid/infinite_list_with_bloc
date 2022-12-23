import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  String? id, title, body;

  Post({this.id, this.title, this.body});

  factory Post.createPost(Map<String, dynamic> object) {
    return Post(id: object['id'], title: object['title'], body: object['body']);
  }

  static Future<List<Post>> connectToAPI(int start, int limit) async {
    var apiURL =
        "https://jsonplaceholder.typicode.com/posts?_start=$start&_limit=$limit";

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body) as List;
    return jsonObject
        .map<Post>((item) => Post(
            id: item['id'].toString(),
            title: item['title'],
            body: item['body']))
        .toList();
  }
}
