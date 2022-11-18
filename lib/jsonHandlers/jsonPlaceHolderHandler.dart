import 'package:http/http.dart' as http;
import 'package:jsonplaceholder_app/consts/jsonPlaceHolderConsts.dart';

import 'dart:convert';

import 'package:jsonplaceholder_app/models/jsonPlaceHolderModel.dart';

class JsonPlaceHolderHandler {
  // GET Function
  Future<List<JsonPlaceHolderModel>> getAllPosts() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url));
    try {
      print('S_Code :  ' + response.statusCode.toString());
      List<dynamic> receivedData = jsonDecode(response.body);
      List<JsonPlaceHolderModel> allPosts = receivedData
          .map((post) => JsonPlaceHolderModel.fromMap(post))
          .toList();

      return allPosts;
    } catch (e) {
      print('ERROR :$e');
    }
    return [];
  }

  Future<JsonPlaceHolderModel> getUser({required int id}) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$id';
    var response = await http.get(Uri.parse(url));
    try {
      print('S_Code :  ' + response.statusCode.toString());
      Map<String, dynamic> receivedData = jsonDecode(response.body);
      JsonPlaceHolderModel model = JsonPlaceHolderModel.fromMap(receivedData);

      return model;
    } catch (e) {
      print('ERROR :$e');
    }
    return JsonPlaceHolderModel(body: '', title: '', user_id: '');
  }

  // POST Functio
  Future sendPost(JsonPlaceHolderModel model) async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    // String parsedPost = jsonEncode(model.toJson());
    var response = await http.post(Uri.parse(url), body: model.toJson());
    try {
      print('S_Code _from_Post :${response.statusCode}');
      print('Your Body From Post : ${response.body}');
    } catch (e) {
      print('ERROR :$e');
    }
  }

  // Put Function
  Future updatePost(
      {required JsonPlaceHolderModel model, required int id}) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$id';
    String parsedData = jsonEncode(model.toJson());
    var response = await http.put(Uri.parse(url), body: model.toJson());
    try {
      print('S-Code For PUT Function : ${response.statusCode}');
      print('your body From POST : ${response.body}');
    } catch (e) {
      print('ERROR : $e');
    }
  }

  // PATCH Function
  Future updateTitleInPost({required String title, required int id}) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$id';
    String parsedData = jsonEncode({TITLE: title});
    var response = await http.patch(Uri.parse(url), body: {TITLE: title});
    try {
      print('S-Code For Patch Function : ${response.statusCode}');
      print('your body From Patch : ${response.body}');
    } catch (e) {
      print('ERROR : $e');
    }
  }

  // DELETE Function
  Future deletePost(int id) async {
    String url = 'https://jsonplaceholder.typicode.com/posts/$id';
    var response = await http.delete(Uri.parse(url), body: {ID: id.toString()});
    try {
      print('S-Code For DELETE Function : ${response.statusCode}');
      print('your body From DELETE : ${response.body}');
    } catch (e) {
      print('ERROR : $e');
    }
  }
}
