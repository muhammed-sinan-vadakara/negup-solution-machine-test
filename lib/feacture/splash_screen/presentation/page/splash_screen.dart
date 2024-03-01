import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/constants/home_page_constants.dart';
import 'package:test_app/feacture/home_page/presentation/page/mobile_home_page.dart';
import 'package:test_app/feacture/home_page/presentation/page/tablet_home_page.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    const double phoneMaxWidth = 650;
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MediaQuery.of(context).size.width <= phoneMaxWidth
                  ? const HomePage()
                  : const ResponsivePage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: TextLiquidFill(
          waveDuration: const Duration(seconds: 1),
          loadDuration: const Duration(seconds: 6),
          text: "TEST APP",
          waveColor: Colors.blueAccent,
          boxBackgroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
          boxHeight: MediaQuery.sizeOf(context).height,
          boxWidth: MediaQuery.sizeOf(context).width,
        ),
      ),
    );
  }
}
