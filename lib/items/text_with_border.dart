import 'package:flutter/material.dart';

class TextWithBorder extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double borderWidth;

  const TextWithBorder({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(fontSize: 20.0, color: Colors.white),
    this.borderWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: textStyle.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = borderWidth
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
