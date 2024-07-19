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
import 'dart:math';

/// A spiral widget that animates a spiral shape.
///
/// The spiral shape is drawn using a custom painter, and the animation is
/// controlled by an `AnimationController`.
class Spiral extends StatefulWidget {
  /// The color of the spiral.
  final Color color;

  /// The size of the spiral.
  final double size;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a new `Spiral` widget.
  ///
  /// Example:
  /// ```dart
  /// Spiral(
  ///   color: Colors.red,
  ///   size: 100.0,
  ///   duration: const Duration(seconds: 2),
  /// )
  /// ```
  const Spiral({
    super.key,
    this.color = Colors.black,
    this.size = 60.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<Spiral> createState() => _SpiralState();
}

class _SpiralState extends State<Spiral> with SingleTickerProviderStateMixin {
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
            painter: SpiralPainter(
              color: widget.color,
              progress: _controller.value,
            ),
          );
        },
      ),
    );
  }
}

/// A custom painter that draws a spiral shape.
class SpiralPainter extends CustomPainter {
  /// The color of the spiral.
  final Color color;

  /// The progress of the animation (between 0 and 1).
  final double progress;

  /// Creates a new `SpiralPainter` instance.
  ///
  /// Example:
  /// ```dart
  /// SpiralPainter(
  ///   color: Colors.blue,
  ///   progress: 0.5,
  /// )
  /// ```
  SpiralPainter({required this.color, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final path = Path();
    final center = size.center(Offset.zero);
    final radius = size.width / 2;
    const angleStep = 0.1;

    for (double t = 0; t <= 2 * 3.141592653589793 * progress; t += angleStep) {
      final x = center.dx + (radius * t / (2 * 3.141592653589793)) * cos(t);
      final y = center.dy + (radius * t / (2 * 3.141592653589793)) * sin(t);
      if (t == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
