import 'package:flutter/material.dart';
import 'package:training_app/core/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              children: const [
                Text(
                  'Training',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageSubtitle,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageDetail,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
