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

/// A custom widget that displays a row of fading dots.
///
/// The dots fade in and out in a repeating animation. You can customize the
/// color, size, and animation duration of the dots.
class FadingDots extends StatefulWidget {
  /// The color of the dots.
  final Color dotColor;

  /// The size of the dots.
  final double dotSize;

  /// The duration of the animation.
  final Duration duration;

  /// Creates a new instance of [FadingDots].
  ///
  /// Example:
  /// ```dart
  /// FadingDots(
  ///   dotColor: Colors.red,
  ///   dotSize: 30.0,
  ///   duration: const Duration(milliseconds: 1500),
  /// )
  /// ```
  const FadingDots({
    super.key,
    this.dotColor = Colors.black,
    this.dotSize = 20.0,
    this.duration = const Duration(milliseconds: 1000),
  });

  @override
  State<FadingDots> createState() => _FadingDotsState();
}

class _FadingDotsState extends State<FadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  /// Initializes the animation controller and animation.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  /// Disposes of the animation controller when the widget is disposed.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the widget tree for the fading dots.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (index) {
          return FadeTransition(
            opacity: _animation,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: widget.dotSize,
              height: widget.dotSize,
              decoration: BoxDecoration(
                color: widget.dotColor,
                shape: BoxShape.circle,
              ),
            ),
          );
        }),
      ),
    );
  }
}
