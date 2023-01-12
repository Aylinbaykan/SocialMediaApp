// To parse this JSON data, do
//
//     final Post = PostFromJson(jsonString);

import 'dart:convert';

List<Post> PostFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String PostToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.description,
    required this.media,
    required this.likeCount,
    required this.disLikeCount,
    required this.authorProfileImage,
    required this.id,
    required this.comments,
    required this.postId,
  });

  DateTime? createdAt;
  String? authorId;
  String? authorName;
  String? description;
  String? media;
  int? likeCount;
  int? disLikeCount;
  String? authorProfileImage;
  String? id;
  List<Post>? comments;
  String? postId;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        createdAt: DateTime.parse(json["createdAt"]),
        authorId: json["authorId"],
        authorName: json["authorName"],
        description: json["description"],
        media: json["media"],
        likeCount: json["likeCount"],
        disLikeCount: json["disLikeCount"],
        authorProfileImage: json["authorProfileImage"],
        id: json["id"],
        comments: json["comments"] == null
            ? []
            : List<Post>.from(json["comments"].map((x) => Post.fromJson(x))),
        postId: json["postId"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toString(),
        "authorId": authorId,
        "authorName": authorName,
        "description": description,
        "media": media,
        "likeCount": likeCount,
        "disLikeCount": disLikeCount,
        "authorProfileImage": authorProfileImage,
        "id": id,
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toJson())),
        "postId": postId,
      };
}

List<Comments> commentsFromJson(String str) =>
    List<Comments>.from(json.decode(str).map((x) => Comments.fromJson(x)));

String commentsToJson(List<Comments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comments {
  Comments({
    required this.createdAt,
    required this.authorName,
    required this.authorId,
    required this.description,
    required this.likeCount,
    required this.disLikeCount,
    required this.authorProfileImage,
    required this.id,
    required this.postId,
  });

  DateTime createdAt;
  String authorName;
  String authorId;
  String description;
  int likeCount;
  int disLikeCount;
  String authorProfileImage;
  String id;
  String postId;

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        createdAt: DateTime.parse(json["createdAt"]),
        authorName: json["authorName"],
        authorId: json["authorId"],
        description: json["description"],
        likeCount: json["likeCount"],
        disLikeCount: json["disLikeCount"],
        authorProfileImage: json["authorProfileImage"],
        id: json["id"],
        postId: json["postId"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "authorName": authorName,
        "authorId": authorId,
        "description": description,
        "likeCount": likeCount,
        "disLikeCount": disLikeCount,
        "authorProfileImage": authorProfileImage,
        "id": id,
        "postId": postId,
      };
}
