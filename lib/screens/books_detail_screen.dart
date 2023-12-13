
import 'dart:developer';

import 'package:bhavdarshak/screens/pdf_viewer.dart';
import 'package:bhavdarshak/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class BookDetailScreen extends StatefulWidget {
  final Map data;

  const BookDetailScreen({super.key, required this.data});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the book cover image
            Center(
              child:CachedNetworkImage(
               imageUrl: widget.data["thumbnail"],
                width: 200,
                height: 300,
                fit: BoxFit.cover,
                errorWidget: (s,f,d){
                  return Container();
                },
              ),
            ),
            SizedBox(height: 20),
            // Display book details: title, author, description
            Text(
              widget.data["title"],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${widget.data["author"]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${widget.data["description"]}',
              style: TextStyle(fontSize: 18),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: button1(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: heading(context, text: "Read", color: Colors.white),
                  ),
                  40, onTap: () async {
                print("http://192.168.1.58:8000" + widget.data["link"]);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PDFScreen(
              
              path: "http://192.168.1.58:8000" + widget.data["link"] ,)));
              }, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
