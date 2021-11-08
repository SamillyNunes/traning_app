import 'package:flutter/material.dart';
import 'package:training_app/core/app_colors.dart';

/// WIdget de badgets
class AppBadget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double? width;

  const AppBadget({
    required this.icon,
    required this.text,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            AppColors.secondPageContainerGradient1stColor,
            AppColors.secondPageContainerGradient2ndColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 5),
          Icon(
            icon,
            size: 20,
            color: AppColors.secondPageIconColor,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.secondPageIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
