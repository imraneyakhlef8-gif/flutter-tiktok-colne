import 'package:flutter/material.dart';

void main() => runApp(const DramaBoxApp());

class DramaBoxApp extends StatelessWidget {
  const DramaBoxApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: const DramaFeed(),
    );
  }
}

class DramaFeed extends StatelessWidget {
  const DramaFeed({super.key});
  final dramas = const [
    {"title": "E5 - Rainy Confession", "views": "1.2M", "locked": false},
    {"title": "E4 - The Secret Date", "views": "890K", "locked": true},
    {"title": "E6 - Jealousy Trap", "views": "2.1M", "locked": true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dramas.length,
        itemBuilder: (context, i) {
          var d = dramas[i];
          bool locked = d["locked"] as bool;
          return Stack(
            children: [
              Container(color: Colors.grey[900], child: const Center(child: Icon(Icons.play_circle_fill, size: 80, color: Color(0xFFE50914)))),
              Positioned(bottom: 100, left: 20, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(d["title"] as String, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text("${d["views"]} views", style: const TextStyle(color: Colors.grey))])),
              Positioned(right: 10, bottom: 100, child: Column(children: [const Icon(Icons.favorite, color: Color(0xFFE50914), size: 35), const Text("24.3K"), const SizedBox(height: 20), Icon(locked? Icons.lock : Icons.lock_open, size: 30), Text(locked? "Unlock" : "Free")])),
              if (locked) Positioned(bottom: 30, left: 20, right: 20, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE50914)), onPressed: () {}, child: const Text("Unlock Episode - 10 Coins"))),
            ],
          );
        },
      ),
    );
  }
}
