import 'package:flutter/material.dart';
import 'package:training_app/pages/exercise_videos/exercise_videos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Training App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExerciseVideosPage(),
    );
  }
}
