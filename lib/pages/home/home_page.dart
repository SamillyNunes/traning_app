import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:training_app/core/app_colors.dart';
import 'package:training_app/core/app_images.dart';
import 'package:training_app/pages/exercise_videos/exercise_videos_page.dart';

import 'widgets/focus_exercise_widget.dart';
import 'widgets/today_exercise_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];

  void _initData() {
    DefaultAssetBundle.of(context).loadString("assets/json/info.json").then(
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
      backgroundColor: AppColors.homePageBackground,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 25,
                    color: AppColors.homePageTitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageDetail,
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    Get.to(() => const ExerciseVideosPage());
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColors.homePageIcons,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TodayExerciseContainer(),
            const SizedBox(height: 5),
            SizedBox(
              height: 180,
              width: _size.width,
              child: Stack(
                children: [
                  Container(
                    width: _size.width,
                    height: 120,
                    margin: const EdgeInsets.only(top: 38),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      image: const DecorationImage(
                        image: AssetImage(
                          AppImages.cardImg,
                        ),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        // sombra inferior
                        BoxShadow(
                          blurRadius: 48,
                          offset: const Offset(8, 18),
                          color: AppColors.gradientSecond.withOpacity(.3),
                        ),
                        // sombra superior
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(-1, -5),
                          color: AppColors.gradientSecond.withOpacity(.3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    width: _size.width,
                    margin: const EdgeInsets.only(right: 200, bottom: 30),
                    decoration: BoxDecoration(
                      // color: Colors.redAccent.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                          AppImages.figureImg,
                        ),
                        // fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    top: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.homePageDetail,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Keep it up\nstick to your plan",
                          style: TextStyle(
                            color: AppColors.homePagePlanColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Area of focus",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColors.homePageTitle,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: info.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) {
                  return FocusExerciseWidget(
                    title: info[index]['title'],
                    image: info[index]['img'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
