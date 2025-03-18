import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:strideup_fitness_app/view/login/welcome_view.dart';

import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  final CarouselSliderController _buttonCarouselController =
      CarouselSliderController();

  final List<Map<String, String>> goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\nand need / want to build more\nmuscle"
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\nno shape. I want to add lean\nmuscle in the right way"
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Lose Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider.builder(
                itemCount: goalArr.length,
                itemBuilder: (context, index, realIndex) {
                  final gObj = goalArr[index];
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: TColor.primaryG,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: media.width * 0.1,
                      horizontal: 25,
                    ),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            gObj["image"]!,
                            width: media.width * 0.5,
                            fit: BoxFit.fitWidth,
                          ),
                          SizedBox(height: media.width * 0.1),
                          Text(
                            gObj["title"]!,
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            width: media.width * 0.1,
                            height: 1,
                            color: TColor.white,
                          ),
                          SizedBox(height: media.width * 0.02),
                          Text(
                            gObj["subtitle"]!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: TColor.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                carouselController: _buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.74,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.05),
                  Text(
                    "What is your goal?",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "It will help us to choose the best\nprogram for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  SizedBox(height: media.width * 0.05),
                  RoundButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeView(),
                        ),
                      );
                    },
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
