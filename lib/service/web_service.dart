import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/application_constants.dart';
import '../model/post.dart';

class WebService {
  //Postlar ve commentler cekilmektedir fakat ayni urller oldugu icin gorsellerde sanki tek bir tane post cekilmekte
  //gibi gorulmektedir. urrlleri webten aratirsaniz yanlislik olmadigini verinin duzgun bir sekilde cekildigini
  //gorebilirsiniz.
  //Postlari ve commentleri ceken apiyi urlini  application_constants.dart tan alip model klasorunun altinda post.dart ile kullanir

  Future<List<Post>> fetchPostFunc() async {
    final response =
        await http.get(Uri.parse(ApplicationConstants.API_URL.toString()));

    try {
      if (response.statusCode == 200) {
        return PostFromJson(response.body.toString());
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  Future<List<Comments>> fetchCommentFunc() async {
    final response =
        await http.get(Uri.parse(ApplicationConstants.API_URL_Comment));

    try {
      if (response.statusCode == 200) {
        return commentsFromJson(response.body.toString());
      }
    } catch (e) {
      print(e);
    }
    return [];
  }

  fetchCommentDelete() async {
    print(ApplicationConstants.API_URL_Comment.toString());

    final response = await http.delete(Uri.parse(
        "https://63347899ea0de5318a039283.mockapi.io/intesa/mobil/post/3/comment/1"));

    return [];
  }
}
