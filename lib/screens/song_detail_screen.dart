import 'package:audioplayers/audioplayers.dart';
import 'package:bhavdarshak/Repository/home_repo.dart';
import 'package:bhavdarshak/styles.dart';
import 'package:flutter/material.dart';

class SongDetailScreen extends StatefulWidget {
  final Map data;

  const SongDetailScreen({super.key, required this.data});

  @override
  State<SongDetailScreen> createState() => _SongDetailScreenState();
}

class _SongDetailScreenState extends State<SongDetailScreen> {
  late AudioPlayer player;
  @override
  void initState() {
    player =
        AudioPlayer(playerId: "http://192.168.1.58:8000" + widget.data["link"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Song Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the book cover image
            Center(
              child: Image.network(
                widget.data["thumbnail"],
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Display book details: title, author, description
            Text(
              widget.data["name"],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Singer: ${widget.data["singer"]}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Duration: ${widget.data["duration"]}',
              style: TextStyle(fontSize: 18),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: button1(
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: heading(context, text: "Play", color: Colors.white),
                  ),
                  40, onTap: () async {
                print("http://192.168.1.58:8000" + widget.data["link"]);
                await player.play(UrlSource(
                    "http://192.168.1.58:8000" + widget.data["link"]));
              }, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
