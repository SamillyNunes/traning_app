import 'dart:convert';

class ExerciseVideoModel {
  final String title;
  final String time;
  final String thumbnail;
  final String videoUrl;

  ExerciseVideoModel({
    required this.title,
    required this.time,
    required this.thumbnail,
    required this.videoUrl,
  });

  ExerciseVideoModel copyWith({
    String? title,
    String? time,
    String? thumbnail,
    String? videoUrl,
  }) {
    return ExerciseVideoModel(
      title: title ?? this.title,
      time: time ?? this.time,
      thumbnail: thumbnail ?? this.thumbnail,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'time': time,
      'thumbnail': thumbnail,
      'videoUrl': videoUrl,
    };
  }

  factory ExerciseVideoModel.fromMap(Map<String, dynamic> map) {
    return ExerciseVideoModel(
      title: map['title'],
      time: map['time'],
      thumbnail: map['thumbnail'],
      videoUrl: map['videoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseVideoModel.fromJson(String source) =>
      ExerciseVideoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExerciseVideoModel(title: $title, time: $time, thumbnail: $thumbnail, videoUrl: $videoUrl)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExerciseVideoModel &&
        other.title == title &&
        other.time == time &&
        other.thumbnail == thumbnail &&
        other.videoUrl == videoUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        time.hashCode ^
        thumbnail.hashCode ^
        videoUrl.hashCode;
  }
}
