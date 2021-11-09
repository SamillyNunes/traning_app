import 'dart:convert';

import 'package:training_app/pages/exercise_videos/models/exercise_video_model.dart';

class ExerciseVideosController {
  List<ExerciseVideoModel> loadExerciseVideosModel(
      {required String videoInfoString}) {
    List exercisesVideosList = json.decode(videoInfoString);

    List<ExerciseVideoModel> exercises = [];

    for (Map<String, dynamic> exerciseVideo in exercisesVideosList) {
      ExerciseVideoModel exerciseVideoModel =
          ExerciseVideoModel.fromMap(exerciseVideo);

      exercises.add(exerciseVideoModel);
    }

    return exercises;
  }
}
