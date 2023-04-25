import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.undeliuned = false,
    this.crossed = false,
    this.textAlign,
    this.maxLines,
  }) : super(key: key);
  String? text;
  Color? color;
  double? size;
  FontWeight? weight;
  bool? undeliuned;
  bool? crossed;
  TextAlign? textAlign;
  int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign ?? textAlign,
      maxLines: maxLines ?? null,
      overflow: TextOverflow.fade,
      style: TextStyle(
        color: color ?? kcTextColor,
        fontSize: size ?? pSh(context: context, percentage: .018),
        fontWeight: weight ?? FontWeight.w500,
        decoration: undeliuned == true
            ? TextDecoration.underline
            : crossed == true
                ? TextDecoration.lineThrough
                : null,
      ),
    );
  }
}
