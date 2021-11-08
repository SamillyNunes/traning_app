import 'package:flutter/material.dart';
import 'package:training_app/core/app_colors.dart';

import 'widgets/app_badgets.dart';

/// Página de detalhes e vídeos acerca de um tipo de exercício
class ExerciseVideosPage extends StatelessWidget {
  const ExerciseVideosPage({Key? key}) : super(key: key);

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
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: AppColors.secondPageIconColor,
                      ),
                      Icon(
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
                      // Container(
                      //   width: 90,
                      //   height: 30,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     gradient: const LinearGradient(
                      //       colors: [
                      //         AppColors.secondPageContainerGradient1stColor,
                      //         AppColors.secondPageContainerGradient2ndColor,
                      //       ],
                      //       begin: Alignment.bottomLeft,
                      //       end: Alignment.topRight,
                      //     ),
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: const [
                      //       Icon(
                      //         Icons.timer,
                      //         size: 20,
                      //         color: AppColors.secondPageIconColor,
                      //       ),
                      //       SizedBox(width: 5),
                      //       Text(
                      //         "68 min",
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: AppColors.secondPageIconColor,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
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
          ],
        ),
      ),
    );
  }
}
