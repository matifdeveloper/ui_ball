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

/// A spinning triangle widget.
///
/// This widget displays a triangle that spins around its center.
///
/// You can customize the color, size, and duration of the spin.
///
/// Example:
/// ```dart
/// SpinningTriangle(
///   color: Colors.red,
///   size: 100.0,
///   duration: Duration(milliseconds: 1000),
/// )
/// ```
class SpinningTriangle extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;

  /// Creates a new instance of [SpinningTriangle].
  ///
  /// [color] is the color of the triangle. Defaults to [Colors.black].
  /// [size] is the size of the triangle. Defaults to 60.0.
  /// [duration] is the duration of the spin. Defaults to 500 milliseconds.
  const SpinningTriangle({
    super.key,
    this.color = Colors.black,
    this.size = 60.0,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<SpinningTriangle> createState() => _SpinningTriangleState();
}

class _SpinningTriangleState extends State<SpinningTriangle>
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
          final double angle = _controller.value * 2 * 3.141592653589793;
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter:
                SpinningTrianglesPainter(color: widget.color, angle: angle),
          );
        },
      ),
    );
  }
}

/// A custom painter for the spinning triangle.
///
/// This painter draws a triangle that spins around its center.
///
/// You can customize the color and angle of the triangle.
///
/// Example:
/// ```dart
/// SpinningTrianglesPainter(
///   color: Colors.blue,
///   angle: 0.5,
/// )
/// ```
class SpinningTrianglesPainter extends CustomPainter {
  final Color color;
  final double angle;

  /// Creates a new instance of [SpinningTrianglesPainter].
  ///
  /// [color] is the color of the triangle.
  /// [angle] is the angle of the triangle in radians.
  SpinningTrianglesPainter({required this.color, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double length = size.width / 4;

    for (int i = 0; i < 3; i++) {
      final double x =
          centerX + length * cos(angle + (2 * i * 3.141592653589793 / 3));
      final double y =
          centerY + length * sin(angle + (2 * i * 3.141592653589793 / 3));
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
