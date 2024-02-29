// class Breakpoint {
//   final double start;
//   final double end;
//   final String name;

//   const Breakpoint({
//     required this.start,
//     required this.end,
//     this.name = '',
//   });
// }

import 'package:responsive_framework/responsive_framework.dart';

const List<Breakpoint> breakpoints = [
  Breakpoint(name: 'Mobile', start: 0, end: 400),
  Breakpoint(name: 'Tablet', start: 401, end: 800),
  Breakpoint(name: 'Large', start: 801, end: double.infinity),
];
