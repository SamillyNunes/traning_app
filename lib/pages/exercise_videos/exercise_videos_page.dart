import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:training_app/core/app_colors.dart';
import 'package:training_app/pages/exercise_videos/exercise_videos_controller.dart';

import 'models/exercise_video_model.dart';
import 'widgets/app_badgets.dart';

/// Página de detalhes e vídeos acerca de um tipo de exercício
class ExerciseVideosPage extends StatefulWidget {
  const ExerciseVideosPage({Key? key}) : super(key: key);

  @override
  State<ExerciseVideosPage> createState() => _ExerciseVideosPageState();
}

class _ExerciseVideosPageState extends State<ExerciseVideosPage> {
  final exerciseVideosController = ExerciseVideosController();

  List<ExerciseVideoModel> exercisesInfo = [];

  Future<List<ExerciseVideoModel>> _initData() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/video_info.json")
        .then(
      (value) {
        setState(() {
          exercisesInfo = exerciseVideosController.loadExerciseVideosModel(
            videoInfoString: value,
          );
        });
      },
    );

    return exercisesInfo;
  }

  // @override
  // void initState() {
  //   _initData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
        future: _initData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientFirst.withOpacity(.9),
                    AppColors.gradientSecond,
                  ],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      top: 70,
                      left: 30,
                      right: 30,
                    ),
                    width: _size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: AppColors.secondPageIconColor,
                              ),
                            ),
                            const Icon(
                              Icons.info_outline_rounded,
                              size: 20,
                              color: AppColors.secondPageIconColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Legs Toning and Glutes Toning",
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColors.secondPageTitleColor,
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          children: const [
                            AppBadget(
                              icon: Icons.timer,
                              text: "68 min",
                              width: 90,
                            ),
                            SizedBox(width: 20),
                            AppBadget(
                              icon: Icons.handyman_outlined,
                              text: "Resistent band, Kettlebell",
                              width: 220,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(70),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Circuit 1: Legs Toning",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.circuitsColor,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.loop,
                                      size: 30,
                                      color: AppColors.loopColor,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "3 sets",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.setsColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 8,
                              ),
                              itemCount: exercisesInfo.length,
                              itemBuilder: (_, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    debugPrint(index.toString());
                                  },
                                  child: SizedBox(
                                    height: 135,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    exercisesInfo[index]
                                                        .thumbnail,
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  exercisesInfo[index].title,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(height: 18),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Text(
                                                    exercisesInfo[index].time,
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade500,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 80,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: AppColors.white500,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
