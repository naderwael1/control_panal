import 'package:bloc_v2/Features/home/presentation/views/home_view.dart';
import 'package:bloc_v2/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sliding_text.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  //handle rete of change of value      -----------------------------=
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initAnimated();
    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Get.to(() => HomeView(), transition: Transition.fade);
    });
  }

//////////////////////////////////////////////////////////////////////////////////////
  void initAnimated() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }

////////////////////////////////////////////////////////////////////////////////////
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        AnimateText(slidingAnimation: slidingAnimation),
      ],
    );
  }
}

class AnimateText extends StatelessWidget {
  const AnimateText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              "Read the free book ",
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
