import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() async{
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

 static Future<Response> getData({@required String url, @required Map<String,dynamic> Query}) async {
    return await dio.get(url, queryParameters: Query);
  }


}
