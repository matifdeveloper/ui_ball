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

/// A customizable ring widget that can be used to display a loading animation.
///
/// Example:
/// ```dart
/// Ring1(
///   color: Colors.blue,
///   size: 50.0,
///   duration: Duration(seconds: 2),
/// )
/// ```
class Ring1 extends StatefulWidget {
  /// The color of the ring.
  ///
  /// Defaults to `Colors.black`.
  final Color color;

  /// The size of the ring.
  ///
  /// Defaults to `30.0`.
  final double size;

  /// The duration of the animation.
  ///
  /// Defaults to `Duration(seconds: 1)`.
  final Duration duration;

  const Ring1({
    super.key,
    this.color = Colors.black,
    this.size = 30.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<Ring1> createState() => _Ring1State();
}

class _Ring1State extends State<Ring1> with SingleTickerProviderStateMixin {
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
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: Ring1Painter(
              color: widget.color,
              progress: _controller.value,
            ),
          );
        },
      ),
    );
  }
}

/// A custom painter for drawing a ring.
class Ring1Painter extends CustomPainter {
  /// The color of the ring.
  final Color color;

  /// The progress of the ring (between 0.0 and 1.0).
  final double progress;

  Ring1Painter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -3.141592653589793 / 2,
      2 * 3.141592653589793 * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
