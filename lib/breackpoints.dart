class Breakpoint {
  final double start;
  final double end;
  final String name;

  const Breakpoint({
    required this.start,
    required this.end,
    this.name = '',
  });
}
