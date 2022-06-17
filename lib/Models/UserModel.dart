// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.status,
    required this.name,
    required this.refresh,
    required this.access,
    required this.message,
    required this.urlId,
  });

  bool status;
  String name;
  String refresh;
  String access;
  String message;
  String urlId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        status: json["status"],
        name: json["name"],
        refresh: json["refresh"],
        access: json["access"],
        message: json["message"],
        urlId: json["url_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "name": name,
        "refresh": refresh,
        "access": access,
        "message": message,
        "url_id": urlId,
      };
}
