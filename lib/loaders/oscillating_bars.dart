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

/// A widget that displays oscillating bars.
///
/// The widget takes three parameters: `color`, `barWidth`, and `duration`.
/// `color` specifies the color of the bars, `barWidth` specifies the width of each bar,
/// and `duration` specifies the duration of the oscillation animation.
///
/// Example:
/// ```dart
/// OscillatingBars(
///   color: Colors.red,
///   barWidth: 20.0,
///   duration: const Duration(seconds: 2),
/// )
/// ```
class OscillatingBars extends StatefulWidget {
  final Color color;
  final double barWidth;
  final Duration duration;

  const OscillatingBars({
    super.key,
    this.color = Colors.black,
    this.barWidth = 10.0,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<OscillatingBars> createState() => _OscillatingBarsState();
}

/// The state class for the `OscillatingBars` widget.
class _OscillatingBarsState extends State<OscillatingBars>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// Initializes the animation controller.
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

  /// Builds the widget tree for the oscillating bars.
  ///
  /// The widget tree consists of a `Center` widget containing an `AnimatedBuilder`
  /// that builds a `Stack` of `Positioned` `Container` widgets, each representing a bar.
  /// The height of each bar is animated using the `_controller` animation.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double value = _controller.value;
          return SizedBox(
            width: widget.barWidth * 3,
            height: widget.barWidth * 2,
            child: Stack(
              children: List.generate(3, (index) {
                final offset = widget.barWidth * index;
                final height = (value * 20 + widget.barWidth);
                return Positioned(
                  left: offset,
                  bottom: 0,
                  child: Container(
                    width: widget.barWidth,
                    height: height,
                    color: widget.color,
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
