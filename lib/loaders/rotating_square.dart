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

/// A rotating square widget that can be customized with a color, size, and rotation duration.
class RotatingSquare extends StatefulWidget {
  /// The color of the square.
  final Color squareColor;

  /// The size of the square.
  final double squareSize;

  /// The duration of the rotation animation.
  final Duration duration;

  /// Creates a new instance of [RotatingSquare].
  ///
  /// Example:
  /// ```dart
  /// RotatingSquare(
  ///   squareColor: Colors.red,
  ///   squareSize: 50.0,
  ///   duration: Duration(seconds: 2),
  /// )
  /// ```
  const RotatingSquare({
    super.key,
    this.squareColor = Colors.black,
    this.squareSize = 30.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<RotatingSquare> createState() => _RotatingSquareState();
}

/// The state of the [RotatingSquare] widget.
class _RotatingSquareState extends State<RotatingSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Initializes the state of the widget.
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  /// Disposes of the animation controller when the widget is disposed.
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Builds the rotating square widget.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Container(
          width: widget.squareSize,
          height: widget.squareSize,
          color: widget.squareColor,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: widget.squareSize / 2,
                  height: widget.squareSize / 2,
                  color: widget.squareColor,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: widget.squareSize / 2,
                  height: widget.squareSize / 2,
                  color: widget.squareColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
