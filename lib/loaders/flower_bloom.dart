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

/// Example usage:
///
/// ```dart
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return FlowerBloom(
///       color: Colors.pink,
///       size: 100.0,
///       duration: const Duration(seconds: 3),
///     );
///   }
/// }
/// ```

/// A widget that displays a blooming flower animation.
///
/// The flower blooms from a small size to a larger size over a specified
/// [duration]. The [color] of the flower can be customized, and the [size]
/// of the flower can be adjusted.
class FlowerBloom extends StatefulWidget {
  /// The color of the flower.
  final Color color;

  /// The size of the flower.
  final double size;

  /// The duration of the blooming animation.
  final Duration duration;

  const FlowerBloom({
    super.key,
    this.color = Colors.black,
    this.size = 80.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<FlowerBloom> createState() => _FlowerBloomState();
}

class _FlowerBloomState extends State<FlowerBloom> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bloomAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
    _bloomAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
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
        animation: _bloomAnimation,
        builder: (context, child) {
          final double scale = _bloomAnimation.value;
          return CustomPaint(
            size: Size(widget.size, widget.size),
            painter: FlowerBloomPainter(
              color: widget.color,
              scale: scale,
            ),
          );
        },
      ),
    );
  }
}

/// A custom painter that draws a blooming flower.
class FlowerBloomPainter extends CustomPainter {
  /// The color of the flower.
  final Color color;

  /// The scale of the flower, ranging from 0.0 to 1.0.
  final double scale;

  FlowerBloomPainter({required this.color, required this.scale});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = size.center(Offset.zero);
    final radius = size.width / 4;

    for (int i = 0; i < 12; i++) {
      final angle = 2 * 3.141592653589793 * i / 12;
      final dx = center.dx + radius * scale * cos(angle);
      final dy = center.dy + radius * scale * sin(angle);
      canvas.drawCircle(
        Offset(dx, dy),
        3.0,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}