import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

class HomeRepository {
  Dio dio = Dio();
  String baseUrl = "http://192.168.1.58:8000/";
  Future getImageData(File file) async {

    dio.options.headers["X-CSRFToken"] = "qDwrl3JphEtmMuDp3of5IlO1JPEG8gf1" ;
    try {
      print(file.path.toString());
      String fileName = file.path.split('/').last;

      var data = FormData.fromMap({
        'image': [await MultipartFile.fromFile(file.path, filename: fileName)],
      });

      var response = await dio.post(
        baseUrl + 'face_detection/',
        data: data,
      );

      return response.data;
    } catch (e) {
      if (e is DioException) {
        print(e.response.toString());
      }
      log(e.toString());
    }
  }
}
