import 'package:flutter/material.dart';
import 'package:training_app/core/app_colors.dart';

class TodayExerciseContainer extends StatelessWidget {
  const TodayExerciseContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      width: _size.width,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gradientFirst.withOpacity(.8),
            AppColors.gradientSecond.withOpacity(.9),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(80),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(5, 18),
            blurRadius: 20,
            color: AppColors.gradientSecond.withOpacity(.2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Next Workout",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.homePageContainerTextSmall,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Legs Toning and Glutes Toning",
            style: TextStyle(
              fontSize: 25,
              color: AppColors.homePageContainerTextSmall,
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(
                Icons.timer,
                size: 20,
                color: AppColors.homePageContainerTextSmall,
              ),
              const SizedBox(width: 10),
              const Text(
                "60 min",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.homePageContainerTextSmall,
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.gradientFirst,
                      blurRadius: 18,
                      offset: Offset(4, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
