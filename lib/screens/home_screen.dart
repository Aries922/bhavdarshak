import 'dart:io';

import 'package:bhavdarshak/controller/home_controller.dart';
import 'package:bhavdarshak/screens/books_detail_screen.dart';
import 'package:bhavdarshak/screens/song_detail_screen.dart';
import 'package:bhavdarshak/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        leading: Container(),
        title: Text('Bhavdarshak'),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final pickedFile = await picker.pickImage(source: ImageSource.camera);

      //     var image = File(pickedFile!.path);
      //     var data = await controller.getData(image);
      //     log(data.toString());
      //   },
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final pickedFile =
                            await picker.pickImage(source: ImageSource.camera);
                        var image = File(pickedFile!.path);
                        await controller.getData(image);
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.green.shade300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "From Camera",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);
                        var image = File(pickedFile!.path);
                        await controller.getData(image);
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.green.shade300),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 3,
                            ),
                            Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "From Gallery",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (controller.isLoading.isTrue) {
                return Padding(
                  padding: const EdgeInsets.all(50),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              if (controller.songs.isEmpty) {
                return Container();
              }
              return Column(
                children: [
                  title("Songs"),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.songs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () async {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: hexColor("F4F4F4"),
                                      border:
                                          Border.all(color: hexColor("EEEEEE")),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, top: 15),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              height: 80,
                                              width: 80,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: CachedNetworkImage(
                                                  imageUrl: controller
                                                      .songs[index]['thumbnail']
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    color: hexColor("820000"),
                                                    child: Center(
                                                        child: heading(context,
                                                            text: controller
                                                                .songs[index]
                                                                    ['name'][0]
                                                                .toString()
                                                                .toUpperCase(),
                                                            weight:
                                                                FontWeight.bold,
                                                            scale: 1.5,
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 4,
                                                    left: 5),
                                                child: SizedBox(
                                                  width: 153,
                                                  child: heading(context,
                                                      text: controller
                                                          .songs[index]['name'],
                                                      height: 1.3,
                                                      weight: FontWeight.w600,
                                                      txtSize: 14,
                                                      maxLines: 2,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 6, left: 5),
                                                child: heading(context,
                                                    text: controller
                                                        .songs[index]['singer'],
                                                    txtSize: 12,
                                                    maxLines: 2,
                                                    color: hexColor("686A8A")),
                                              ),
                                              Expanded(child: SizedBox()),
                                              // communityCategory
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Material(
                                                  elevation: 2,
                                                  shadowColor:
                                                      hexColor("f2f2f2")
                                                          .withOpacity(0.5),
                                                  child: Container(
                                                    width: 154,
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: button1(
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        2),
                                                            child: heading(
                                                                context,
                                                                color: hexColor(
                                                                    "686A8A"),
                                                                txtSize: 12,
                                                                weight:
                                                                    FontWeight
                                                                        .w600,
                                                                text: "Open"),
                                                          ),
                                                          5,
                                                          color: Colors.white,
                                                          onTap: () {
                                                              Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  SongDetailScreen(
                                                                      data: controller
                                                                              .songs[
                                                                          index])));
                                                          }),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SBox(context, 0.015)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              );
            }),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              if (controller.books.isEmpty) {
                return Container();
              }
              return Column(
                children: [
                  title("Books"),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.books.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () async {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: hexColor("F4F4F4"),
                                      border:
                                          Border.all(color: hexColor("EEEEEE")),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12, top: 15),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              height: 80,
                                              width: 80,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: CachedNetworkImage(
                                                  imageUrl: controller
                                                      .books[index]['thumbnail']
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    color: hexColor("820000"),
                                                    child: Center(
                                                        child: heading(context,
                                                            text: controller
                                                                .books[index]
                                                                    ['title'][0]
                                                                .toString()
                                                                .toUpperCase(),
                                                            weight:
                                                                FontWeight.bold,
                                                            scale: 1.5,
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 4,
                                                    left: 5),
                                                child: SizedBox(
                                                  width: 153,
                                                  child: heading(context,
                                                      text: controller
                                                              .books[index]
                                                          ['title'],
                                                      height: 1.3,
                                                      weight: FontWeight.w600,
                                                      txtSize: 14,
                                                      maxLines: 2,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 6, left: 5),
                                                child: heading(context,
                                                    text: controller
                                                        .books[index]['author'],
                                                    txtSize: 12,
                                                    maxLines: 2,
                                                    color: hexColor("686A8A")),
                                              ),
                                              Expanded(child: SizedBox()),
                                              // communityCategory
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5),
                                                child: Material(
                                                  elevation: 2,
                                                  shadowColor:
                                                      hexColor("f2f2f2")
                                                          .withOpacity(0.5),
                                                  child: Container(
                                                    width: 154,
                                                    child: button1(
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 2),
                                                          child: heading(
                                                              context,
                                                              color: hexColor(
                                                                  "686A8A"),
                                                              txtSize: 12,
                                                              weight: FontWeight
                                                                  .w600,
                                                              text: "Open"),
                                                        ),
                                                        5,
                                                        color: Colors.white,
                                                        onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  BookDetailScreen(
                                                                      data: controller
                                                                              .books[
                                                                          index])));
                                                    }),
                                                  ),
                                                ),
                                              ),
                                              SBox(context, 0.015)
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget title(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              heading(context,
                  text: title, weight: FontWeight.w700, scale: 1.2),
            ],
          ),
          navigate(
            context: context,
            page: null,
            child: Row(children: [
              heading(context, text: "View All", color: hexColor("4686F2")),
              Icon(
                Icons.keyboard_arrow_right_outlined,
                color: hexColor("4686F2"),
              )
            ]),
          )
        ],
      ),
    );
  }
}
