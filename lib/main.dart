import 'package:flutter/material.dart';
import 'package:test_app/responcive_layout_builder.dart';
import 'package:test_app/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      title: 'AKMALS_AREA',
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


