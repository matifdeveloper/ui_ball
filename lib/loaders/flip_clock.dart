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

/// A FlipClock widget that displays a rotating clock face.
///
/// The clock face is divided into two halves, with the top-left half being a solid color and the bottom-right half being a semi-transparent version of the same color.
/// The clock face rotates continuously, creating a flip clock effect.
///
/// Example:
/// ```dart
/// FlipClock(
///   color: Colors.red,
///   size: 80.0,
///   duration: Duration(seconds: 2),
/// )
/// ```
class FlipClock extends StatefulWidget {
  /// The color of the clock face.
  ///
  /// Defaults to `Colors.black`.
  final Color color;

  /// The size of the clock face.
  ///
  /// Defaults to `60.0`.
  final double size;

  /// The duration of one rotation of the clock face.
  ///
  /// Defaults to `Duration(seconds: 1)`.
  final Duration duration;

  const FlipClock({
    super.key,
    this.color = Colors.black,
    this.size = 60.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<FlipClock> createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> with SingleTickerProviderStateMixin {
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
          return Transform.rotate(
            angle: _controller.value * 2 * 3.141592653589793,
            child: SizedBox(
              width: widget.size,
              height: widget.size,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: widget.size / 2,
                      height: widget.size / 2,
                      color: widget.color,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: widget.size / 2,
                      height: widget.size / 2,
                      color: widget.color.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}