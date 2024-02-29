import 'package:flutter/material.dart';
import 'package:test_app/breackpoints.dart';
import 'package:test_app/feacture/home_page/presentation/page/mobile_home_page.dart';
import 'package:test_app/responcive_layout_builder.dart';

void main() {
  runApp(const TestApp());
}

//This project is follow by clean Architecture .
//there was many folder and files are present in clean architecture but this project no need that blank folders that i will removed
//Riverpod code generator is used .

//before run the application please follow the things
//    1) Go to the terminal of the application.
//    2) Run this(by take copy or type the terminal) = flutter pub run build_runner build 
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST APP',
      home: ResponsiveLayoutBuilder(
        child: const HomePage(),
        breakpoints: breakpoints,
        builder: (context, breakpoint) {
          if (breakpoint.name == 'Mobile') {
            return const HomePage();
          } else if (breakpoint.name == 'Tablet') {
            return const HomePage();
          } else if (breakpoint.name == 'Desktop') {
            return const HomePage();
          } else {
            return const HomePage(); // For large screens
          }
        },
      ),
    );
  }
}
