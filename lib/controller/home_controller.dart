import 'dart:io';

import 'package:bhavdarshak/Repository/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository repo = HomeRepository();
  RxList songs = [].obs;
  RxList books = [].obs;
  RxBool isLoading = false.obs;

  Future getData(File image) async {
    isLoading.value = true;
    update();
    var data = await repo.getImageData(image);
    songs.clear();
    books.clear();
    songs.addAll(data["songs"]);
    books.addAll(data["books"]);
    isLoading.value = false;
    update();
    return;
  }
}
