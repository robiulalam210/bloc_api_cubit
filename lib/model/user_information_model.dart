// To parse this JSON data, do
//
//     final userInformation = userInformationFromJson(jsonString);

import 'dart:convert';

List<UserInformation> userInformationFromJson(String str) => List<UserInformation>.from(json.decode(str).map((x) => UserInformation.fromJson(x)));

String userInformationToJson(List<UserInformation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserInformation {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserInformation({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) => UserInformation(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
