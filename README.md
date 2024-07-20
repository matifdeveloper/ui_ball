# ui_ball

Welcome to the `ui_ball` package! This package offers a variety of free and open-source loaders and spinners to enhance your Flutter projects. With numerous loader options available, you'll find just the right animation for your needs.

## Install

To add `ui_ball` to your project, include it in your `pubspec.yaml` file:

```yaml
dependencies:
  ui_ball: ^0.0.2
```

Run `flutter pub get` to install the package.

### Usage
Import the package into your Dart file:

`import 'package:ui_ball/ui_ball.dart';`

### Demo
https://github.com/user-attachments/assets/a0e56ca3-c3a2-429f-857f-35dde7055674

### Loaders and Spinners
Here are some examples of loaders and spinners available in the ui_ball package:

### WobbleBar
A bar that wobbles with customizable colors and size.

```
WobbleBar(
  width: 300.0,
  height: 10.0,
  movingBarColor: Colors.red,
  backgroundColor: Colors.blueGrey,
  duration: const Duration(milliseconds: 1500),
  stroke: 10.0,
  movingBarWidth: 70.0,
)
```

### PulseLoader
A loader that pulses with a customizable color and size.

```
PulseLoader(
  color: Colors.red,
  size: 100.0,
  duration: Duration(seconds: 2),
)
```

### BouncingDot
A dot that bounces with customizable color and size.

```
BouncingDot(
  dotColor: Colors.black,
  dotSize: 30.0,
  duration: Duration(seconds: 2),
)
```

### RotatingSquare
A square that rotates with customizable color and size.

```
RotatingSquare(
  squareColor: Colors.red,
  squareSize: 50.0,
  duration: Duration(seconds: 2),
)
```

### FadingDots
Dots that fade with customizable color and size.

```
FadingDots(
  dotColor: Colors.red,
  dotSize: 30.0,
  duration: const Duration(milliseconds: 1500),
)
```

### ExpandingCircle
A circle that expands with customizable color and size.

```
ExpandingCircle(
  color: Colors.red,
  size: 50.0,
  duration: Duration(seconds: 2),
)
```

### FlipClock
A flip clock animation with customizable color and size.

```
FlipClock(
  color: Colors.red,
  size: 80.0,
  duration: Duration(seconds: 2),
)
```

### RainbowSpinner
A spinner with a rainbow effect.

```
RainbowSpinner(
  size: 100.0,
  duration: Duration(seconds: 2)
);
```


### OscillatingBars
Bars that oscillate with customizable color and width.

```
OscillatingBars(
  color: Colors.red,
  barWidth: 20.0,
  duration: const Duration(seconds: 2),
)
```

### SpinningTriangle
A triangle that spins with customizable color and size.

```
SpinningTriangle(
  color: Colors.red,
  size: 100.0,
  duration: Duration(milliseconds: 1000),
)
```

### Ring1
A ring animation with customizable color and size.

```
Ring1(
  color: Colors.blue,
  size: 50.0,
  duration: Duration(seconds: 2),
)
```

### Spiral
A spiral animation with customizable color and size.

```
Spiral(
  color: Colors.red,
  size: 100.0,
  duration: const Duration(seconds: 2),
)
```

### FlowerBloom
A flower blooming animation with customizable color and size.

```
FlowerBloom(
  color: Colors.pink,
  size: 100.0,
  duration: const Duration(seconds: 3),
)
```

Then, you can use any of the loaders or spinners in your widget tree as demonstrated in the examples above.

### Contributing

> Contributions are welcome! Please feel free to open an issue or submit a pull request.

## Support

If you find this package useful and want to support its development, you can buy me a coffee:

[![Buy Me a Coffee](https://www.buymeacoffee.com/assets/img/custom_images/black_img.png)](https://www.paypal.com/ncp/payment/D56UA3TJ5LQ7G)

Thank you for your support!
