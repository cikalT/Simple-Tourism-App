import 'package:flutter/material.dart';

class IconWithBorder extends StatelessWidget {
  final IconData iconData;
  final double size;
  final Color iconColor;
  final Color borderColor;

  const IconWithBorder({
    super.key,
    required this.iconData,
    this.size = 25,
    this.iconColor = Colors.white70,
    this.borderColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          iconData,
          color: borderColor,
          size: size + 2,
        ),
        Positioned.fill(
          child: Icon(
            iconData,
            color: iconColor,
            size: size,
          ),
        ),
      ],
    );
  }
}
