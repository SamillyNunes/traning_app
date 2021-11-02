import 'package:flutter/material.dart';
import 'package:training_app/core/app_colors.dart';

class FocusExerciseWidget extends StatelessWidget {
  const FocusExerciseWidget({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(
              image,
            ),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: const Offset(5, 5),
              color: AppColors.gradientSecond.withOpacity(.1),
            ),
            BoxShadow(
              blurRadius: 3,
              offset: const Offset(-5, -5),
              color: AppColors.gradientSecond.withOpacity(.1),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.homePageDetail,
            ),
          ),
        ),
      ),
    );
  }
}
