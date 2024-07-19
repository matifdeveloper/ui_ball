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

/// A custom loader widget that displays a bouncing dot animation.
///
/// This widget can be used to indicate loading or progress in a user interface.
/// It takes three optional parameters: `dotColor`, `dotSize`, and `duration`.
///
/// Example:
/// ```dart
/// BouncingDot(
///   dotColor: Colors.red,
///   dotSize: 30.0,
///   duration: Duration(seconds: 2),
/// )
/// ```
class BouncingDot extends StatefulWidget {
  /// The color of the bouncing dot.
  final Color dotColor;

  /// The size of the bouncing dot.
  final double dotSize;

  /// The duration of the bouncing animation.
  final Duration duration;

  const BouncingDot({
    super.key,
    this.dotColor = Colors.black,
    this.dotSize = 20.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<BouncingDot> createState() => _BouncingDotState();
}

class _BouncingDotState extends State<BouncingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  /// Initializes the animation controller and animation.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));
  }

  /// Disposes of the animation controller when the widget is removed.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the bouncing dot loader widget.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return SizedBox(
            height: widget.dotSize * 4,
            width: widget.dotSize * 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: _animation.value * (widget.dotSize * 2),
                  child: Container(
                    width: widget.dotSize,
                    height: widget.dotSize,
                    decoration: BoxDecoration(
                      color: widget.dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}