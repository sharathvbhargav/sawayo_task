import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class IconClicker extends StatelessWidget {
  final IconData icon;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? size;
  final double? iconSize;

  const IconClicker({Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 40,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size! / 2),
        //color: Colors.white.withOpacity(0.8)
        color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize ?? Dimensions.size16,
      ),
    );
  }
}
