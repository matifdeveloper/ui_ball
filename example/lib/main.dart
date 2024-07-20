import 'package:flutter/material.dart';
import 'package:ui_ball/ui_ball.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: UiBall(),
    );
  }
}

class UiBall extends StatefulWidget {
  const UiBall({super.key});

  @override
  State<UiBall> createState() => _UiBallState();
}

class _UiBallState extends State<UiBall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI BALL'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            loader(
                const WobbleBar(
                  width: 300.0,
                  height: 10.0,
                  movingBarColor: Colors.red,
                  backgroundColor: Colors.blueGrey,
                  duration: Duration(milliseconds: 1500),
                  stroke: 10.0,
                  movingBarWidth: 70.0,
                ),
                'WobbleBar '),
            loader(
                const PulseLoader(
                  color: Colors.red,
                  size: 50.0,
                  duration: Duration(seconds: 2),
                ),
                'PulseLoader '),
            loader(
                const BouncingDot(
                  dotColor: Colors.black,
                  dotSize: 30.0,
                  duration: Duration(seconds: 2),
                ),
                'BouncingDot '),
            loader(
                const RotatingSquare(
                  squareColor: Colors.red,
                  squareSize: 50.0,
                  duration: Duration(seconds: 2),
                ),
                'RotatingSquare '),
            loader(
                const FadingDots(
                  dotColor: Colors.red,
                  dotSize: 30.0,
                  duration: Duration(milliseconds: 1500),
                ),
                'FadingDots '),
            loader(
                const FlipClock(
                  color: Colors.red,
                  size: 80.0,
                  duration: Duration(seconds: 2),
                ),
                'FlipClock'),
            loader(
                const RainbowSpinner(
                    size: 100.0, duration: Duration(seconds: 2)),
                'RainbowSpinner'),
            loader(
                const OscillatingBars(
                  color: Colors.red,
                  barWidth: 20.0,
                  duration: Duration(seconds: 2),
                ),
                'OscillatingBars '),
            loader(
                const SpinningTriangle(
                  color: Colors.red,
                  size: 100.0,
                  duration: Duration(milliseconds: 1000),
                ),
                'SpinningTriangle '),
            loader(
                const Ring1(
                  color: Colors.blue,
                  size: 50.0,
                  duration: Duration(seconds: 2),
                ),
                'Ring1 '),
            loader(
                const Spiral(
                  color: Colors.red,
                  size: 100.0,
                  duration: Duration(seconds: 2),
                ),
                'Spiral '),
            loader(
                const FlowerBloom(
                  color: Colors.pink,
                  size: 100.0,
                  duration: Duration(seconds: 3),
                ),
                'FlowerBloom ')
          ],
        ),
      ),
    );
  }

  Widget loader(Widget child, String title) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          child,
          const SizedBox(
            height: 12,
          ),
          Text(title),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
