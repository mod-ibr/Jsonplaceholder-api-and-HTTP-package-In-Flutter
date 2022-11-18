import 'package:flutter/cupertino.dart';
import 'package:jsonplaceholder_app/consts/jsonPlaceHolderConsts.dart';

class JsonPlaceHolderModel {
  late String user_id;
  late String title;
  late String body;
  String? id;

  JsonPlaceHolderModel({
    required this.body,
    required this.title,
    required this.user_id,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      USER_ID: user_id,
      TITLE: title,
      BODY: body,
    };
  }

  JsonPlaceHolderModel.fromMap(Map<String, dynamic> map) {
    user_id = map[USER_ID].toString();
    id = map[ID].toString();
    title = map[TITLE];
    body = map[BODY];
  }
}
