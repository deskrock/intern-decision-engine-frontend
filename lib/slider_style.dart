import 'package:flutter/material.dart';
import 'package:inbank_frontend/colors.dart';

// This class represents the shape of the thumb of a slider.
// It extends the SliderComponentShape class and overrides
// the methods needed to draw the thumb.
class ThumbShape extends SliderComponentShape {
  static const double _thumbRadius = 10.0;
  static const double _thumbStrokeWidth = 3.0;
  static const Color _thumbColor = AppColors.textColor;
  static const Color _thumbBorderColor = AppColors.secondaryColor;

  // This method returns the preferred size of the thumb.
  // The thumb will be a circle with a radius of _thumbRadius.
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size.fromRadius(_thumbRadius);
  }

  // This method paints the thumb on the canvas.
  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
    bool? isEnabled,
    bool? onThumb,
  }) {
    final canvas = context.canvas;
    const radius = _thumbRadius;
    const strokeWidth = _thumbStrokeWidth;
    final paint = Paint()
      ..color = _thumbBorderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(center, radius, Paint()..color = _thumbColor);
  }
}

// This theme data is used to style the slider.
final sliderThemeData = SliderThemeData(
  activeTrackColor: AppColors.secondaryColor,
  inactiveTrackColor: AppColors.textColor,
  thumbColor: AppColors.textColor,
  tickMarkShape: SliderTickMarkShape.noTickMark,
  trackHeight: 5.5,
  thumbShape: ThumbShape(),
  overlayShape: SliderComponentShape.noOverlay,
  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
  valueIndicatorColor: AppColors.secondaryColor,
  valueIndicatorTextStyle: const TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.bold,
  ),
  rangeThumbShape: const RoundRangeSliderThumbShape(
    enabledThumbRadius: 10,
    elevation: 0,
    pressedElevation: 0,
  ),
  rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
  rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),
);
