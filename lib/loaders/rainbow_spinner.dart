/*
 ********************************************************************************

    _____/\\\\\\\\\_____/\\\\\\\\\\\\\\\__/\\\\\\\\\\\__/\\\\\\\\\\\\\\\_
    ___/\\\\\\\\\\\\\__\///////\\\/////__\/////\\\///__\/\\\///////////__
    __/\\\/////////\\\_______\/\\\___________\/\\\_____\/\\\_____________
    _\/\\\_______\/\\\_______\/\\\___________\/\\\_____\/\\\\\\\\\\\_____
    _\/\\\\\\\\\\\\\\\_______\/\\\___________\/\\\_____\/\\\///////______
    _\/\\\/////////\\\_______\/\\\___________\/\\\_____\/\\\_____________
    _\/\\\_______\/\\\_______\/\\\___________\/\\\_____\/\\\_____________
    _\/\\\_______\/\\\_______\/\\\________/\\\\\\\\\\\_\/\\\_____________
    _\///________\///________\///________\///////////__\///______________

    Created by Muhammad Atif on 19/07/2024.
    Portfolio https://atifnoori.web.app.

 ********************************************************************************
 */

import 'package:flutter/material.dart';

/// A spinning rainbow circle widget.
///
/// This widget displays a spinning circle with a rainbow effect. The size and
/// duration of the spin can be customized.
class RainbowSpinner extends StatefulWidget {
  /// The size of the spinner.
  final double size;

  /// The duration of one spin cycle.
  final Duration duration;

  /// Creates a new instance of [RainbowSpinner].
  ///
  /// Example:
  /// ```dart
  /// RainbowSpinner(size: 100.0, duration: Duration(seconds: 2));
  /// ```
  const RainbowSpinner({
    super.key,
    this.size = 50.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<RainbowSpinner> createState() => _RainbowSpinnerState();
}

class _RainbowSpinnerState extends State<RainbowSpinner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final colors = [
            Colors.red,
            Colors.orange,
            Colors.yellow,
            Colors.green,
            Colors.blue,
            Colors.indigo,
            Colors.purple,
          ];
          final index = (_controller.value * colors.length).floor();
          final color = colors[index % colors.length];

          return SizedBox(
            width: widget.size,
            height: widget.size,
            child: CustomPaint(
              painter: RainbowSpinnerPainter(color: color),
            ),
          );
        },
      ),
    );
  }
}

/// A custom painter for the rainbow spinner.
class RainbowSpinnerPainter extends CustomPainter {
  /// The color of the spinner.
  final Color color;

  /// Creates a new instance of [RainbowSpinnerPainter].
  ///
  /// Example:
  /// ```dart
  /// RainbowSpinnerPainter(color: Colors.red);
  /// ```
  RainbowSpinnerPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    canvas.drawCircle(
      size.center(Offset.zero),
      size.width / 2,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
