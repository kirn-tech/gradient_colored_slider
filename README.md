# Gradient Colored Slider

A GradientColoredSlider slider.

Used to select from a range of values.

You can customize slider track gradient colors, as well as tracks bar width and bar space.

## Preview

<p align="center">
	<img src="https://user-images.githubusercontent.com/88337052/132983355-4ada1fde-3dca-433c-8fb2-76fff3391dbe.gif" />
</p>

## Usage

```dart
  double _currentSliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return GradientColoredSlider(
      value: _currentSliderValue,
      onChanged: (double value) {
       setState(() {
         _currentSliderValue = value;
       });
     },
    );
  }
```


