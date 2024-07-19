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

/// A custom widget that displays a wobbling bar.
///
/// The wobbling bar is a horizontal bar that moves back and forth within a
/// container. The bar's color, width, and animation duration can be customized.
///
/// Example:
/// ```dart
/// WobbleBar(
///   width: 300.0,
///   height: 10.0,
///   movingBarColor: Colors.red,
///   backgroundColor: Colors.blueGrey,
///   duration: const Duration(milliseconds: 1500),
///   stroke: 10.0,
///   movingBarWidth: 70.0,
/// )
/// ```
class WobbleBar extends StatefulWidget {
  /// The width of the wobbling bar container.
  ///
  /// Defaults to 200.0.
  final double width;

  /// The height of the wobbling bar.
  ///
  /// Defaults to 5.0.
  final double height;

  /// The color of the moving bar.
  ///
  /// Defaults to Colors.black.
  final Color movingBarColor;

  /// The background color of the wobbling bar container.
  ///
  /// Defaults to Colors.grey.
  final Color backgroundColor;

  /// The duration of the wobbling animation.
  ///
  /// Defaults to a Duration of 1000 milliseconds.
  final Duration duration;

  /// The stroke width of the wobbling bar container.
  ///
  /// Defaults to 5.0.
  final double stroke;

  /// The width of the moving bar.
  ///
  /// Defaults to 50.0.
  final double movingBarWidth;

  const WobbleBar({
    super.key,
    this.width = 200.0,
    this.height = 5.0,
    this.movingBarColor = Colors.black,
    this.backgroundColor = Colors.grey,
    this.duration = const Duration(milliseconds: 1000),
    this.stroke = 5.0,
    this.movingBarWidth = 50.0,
  });

  @override
  State<WobbleBar> createState() => _WobbleBarState();
}

class _WobbleBarState extends State<WobbleBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.stroke,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.stroke / 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.stroke / 2),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left: (_animation.value + 1) *
                      (widget.width - widget.movingBarWidth) /
                      2,
                  child: Container(
                    width: widget.movingBarWidth,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: widget.movingBarColor,
                      borderRadius: BorderRadius.circular(widget.stroke / 2),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
