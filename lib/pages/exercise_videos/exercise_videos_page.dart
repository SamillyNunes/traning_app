import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_app/core/app_colors.dart';

import 'widgets/app_badgets.dart';

/// Página de detalhes e vídeos acerca de um tipo de exercício
class ExerciseVideosPage extends StatefulWidget {
  const ExerciseVideosPage({Key? key}) : super(key: key);

  @override
  State<ExerciseVideosPage> createState() => _ExerciseVideosPageState();
}

class _ExerciseVideosPageState extends State<ExerciseVideosPage> {
  List info = [];

  void _initData() {
    DefaultAssetBundle.of(context)
        .loadString("assets/json/video_info.json")
        .then(
      (value) {
        setState(() {
          info = json.decode(value);
        });
      },
    );
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
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
                padding: const EdgeInsets.only(left: 30, right: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Row(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
