import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:socialmedia/model/post.dart';
import 'package:socialmedia/service/web_service.dart';
import 'package:provider/provider.dart';

enum PostState { IDLE, BUSY, ERROR }

class SocialMediaModel extends BaseViewModel {
  TextEditingController descriptionText = TextEditingController();
  TextEditingController commentDescriptionText = TextEditingController();

  static String count = '3';

  late PostState _state;

  late List<Post> jobList;
  late List<Comments> commentList;
  late List commentListDelete;

  SocialMediaModel() {
    commentList = [];
    jobList = [];
    _state = PostState.IDLE;

    fetchJobs();

    fetchCommentFunc();
  }

  PostState get state => _state;
  set state(PostState state) {
    _state = state;
    notifyListeners();
  }

  //WebServiceten gelen verileri
  Future<List<Post>> fetchJobs() async {
    try {
      state = PostState.BUSY;
      jobList = await WebService().fetchPostFunc();
      state = PostState.IDLE;

      return jobList;
    } catch (e) {
      print(e);

      return [];
    }
  }

  Future<List<Comments>> fetchCommentFunc() async {
    try {
      state = PostState.BUSY;
      commentList = await WebService().fetchCommentFunc();
      state = PostState.IDLE;
      return commentList;
    } catch (e) {
      print(e);

      return [];
    }
  }

  fetchCommentDeleteFunc() async {
    try {
      state = PostState.BUSY;
      commentListDelete = await WebService().fetchCommentDelete();
      state = PostState.IDLE;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
