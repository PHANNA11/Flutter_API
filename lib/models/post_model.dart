import 'dart:convert';

class Post {
  late int userId;
  late int id;
  late String title;
  late String body;
  Post(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});
  factory Post.fromJson(Map<String, dynamic> json) => Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"]);
  Map<String, dynamic> toJson() => {
        "userid": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

List<Post>? postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
