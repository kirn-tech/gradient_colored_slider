import 'package:flutter/material.dart';
import 'package:gradient_colored_slider/gradient_colored_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Material(child: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _TOP_SLIDER_MAX_STEP = 5;

  double _topSliderValue = 0.3;
  double _bottomSliderValue = 0.7;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: GradientColoredSlider(
                value: _topSliderValue,
                barWidth: 8,
                barSpace: 4,
                onChanged: (double value) {
                  setState(() {
                    _topSliderValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            Text('${_rangedSelectedValue(_TOP_SLIDER_MAX_STEP, _topSliderValue)}', style: TextStyle(fontSize: 32)),
            const SizedBox(height: 32),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 55,
              color: Colors.grey[300],
              child: GradientColoredSlider(
                value: _bottomSliderValue,
                barWidth: 5,
                barSpace: 2,
                gradientColors: _colors,
                onChanged: (double value) {
                  setState(() {
                    _bottomSliderValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(_bottomSliderValue.toStringAsFixed(2), style: TextStyle(fontSize: 32)),
          ],
        ),
      ),
    );
  }

  final List<Color> _colors = [
    Color.fromARGB(255, 255, 0, 0),
    Color.fromARGB(255, 255, 128, 0),
    Color.fromARGB(255, 255, 255, 0),
    Color.fromARGB(255, 128, 255, 0),
    Color.fromARGB(255, 0, 255, 0),
    Color.fromARGB(255, 0, 255, 128),
    Color.fromARGB(255, 0, 255, 255),
    Color.fromARGB(255, 0, 128, 255),
    Color.fromARGB(255, 0, 0, 255),
    Color.fromARGB(255, 127, 0, 255),
    Color.fromARGB(255, 255, 0, 255),
    Color.fromARGB(255, 255, 0, 127),
  ];
}

int _rangedSelectedValue(int maxSteps, double value) {
  double stepRange = 1.0 / maxSteps;
  return (value / stepRange + 1).clamp(1, maxSteps).toInt();
}
