import 'package:covide_tracker/pages/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: controller.animationController,
              child: Image.asset(
                'assets/virus.png',
                height: 200,
                width: 200,
              ),
              builder: (_, Widget? child) => Transform.rotate(
                    angle: 2 * 3.14 * controller.animationController.value,
                    child: child,
                  )),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.08,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Covid-19\n Tracker App',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
