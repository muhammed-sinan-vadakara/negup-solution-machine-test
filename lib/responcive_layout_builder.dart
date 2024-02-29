import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveLayoutBuilder extends StatelessWidget {
  final Widget child;
  final List<Breakpoint> breakpoints;
  final Widget Function(BuildContext context, Breakpoint breakpoint) builder;

  const ResponsiveLayoutBuilder({
    required this.child,
    required this.breakpoints,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      child: child,
      breakpoints: breakpoints,

      // builder: (context, breakpoint) => builder(context, breakpoint),
    );
  }
}



  // builder: (context, child) => ResponsiveBreakpoints.builder(
  //       child: child!,
  //       breakpoints: [
  //         const Breakpoint(start: 0, end: 450, name: MOBILE),
  //         const Breakpoint(start: 451, end: 800, name: TABLET),
  //         const Breakpoint(start: 801, end: 1920, name: DESKTOP),
  //         const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
  //       ],
  //     ),