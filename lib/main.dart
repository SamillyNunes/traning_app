import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/pages/exercise_videos/exercise_videos_page.dart';
import 'package:training_app/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Training App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExerciseVideosPage(),
    );
  }
}
