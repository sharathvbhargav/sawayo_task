import 'package:flutter/material.dart';
import 'package:food_delivery/custom_widgets/small_text.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';

class CounterText extends StatefulWidget {
  final String header;
  final String valueText;
  const CounterText({Key? key, required this.header, required this.valueText}) : super(key: key);

  @override
  State<CounterText> createState() => _CounterTextState();
}

class _CounterTextState extends State<CounterText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SmallText(
          text: widget.header,
          size: 20,
          color: AppColors.headerTextColor
        ),
        SizedBox(height: Dimensions.height10),
        Text(
          widget.valueText,
          style:const TextStyle(
            fontSize: 14,
            color:AppColors.black,
            fontWeight: FontWeight.bold)
        ),
      ],
    );
  }
}
