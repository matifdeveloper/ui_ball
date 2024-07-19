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

/// A widget that displays rotating lines.
///
/// This widget is useful for creating a loading indicator or a progress
/// indicator. It consists of multiple lines that rotate around a central
/// point, creating a sense of movement.
class RotatingLines extends StatefulWidget {
  /// The size of the rotating lines.
  ///
  /// Defaults to 50.0.
  final double size;

  /// The color of the rotating lines.
  ///
  /// Defaults to black.
  final Color color;

  /// The speed at which the lines rotate.
  ///
  /// Defaults to 900 milliseconds.
  final Duration speed;

  /// The stroke width of the lines.
  ///
  /// Defaults to 5.
  final double stroke;

  const RotatingLines({
    super.key,
    this.size = 50.0,
    this.color = Colors.black,
    this.speed = const Duration(milliseconds: 900),
    this.stroke = 5,
  });

  @override
  State<RotatingLines> createState() => _RotatingLinesState();
}

class _RotatingLinesState extends State<RotatingLines>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Initializes the animation controller.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.speed,
      vsync: this,
    )..repeat();
  }

  /// Disposes of the animation controller when the widget is disposed.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the rotating lines widget.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(6, (index) {
          final opacity = 1.0 - index * 0.2;
          final delay = (index + 1) * 0.15;
          return _buildLine(delay, opacity);
        }),
      ),
    );
  }

  /// Builds a single rotating line.
  ///
  /// [delay] is the delay in seconds before the line starts rotating.
  /// [opacity] is the opacity of the line, ranging from 0.0 to 1.0.
  Widget _buildLine(double delay, double opacity) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = (_controller.value + delay) % 1.0;
        return Transform.rotate(
          angle: progress * 3.14,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: widget.size,
              height: widget.stroke,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(opacity),
                borderRadius: BorderRadius.circular(widget.stroke / 2),
              ),
            ),
          ),
        );
      },
    );
  }
}
