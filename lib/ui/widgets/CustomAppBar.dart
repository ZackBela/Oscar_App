import 'package:flutter/material.dart';
import 'package:oscar/ui/common/ui_helpers.dart';
import 'package:oscar/ui/widgets/CustomText.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.arrow_back_ios,
          size: pSh(context: context, percentage: .02),
        ),
        CustomText(
            text: 'Résultats de la recherche',
            weight: FontWeight.w500,
            size: pSh(context: context, percentage: .018)),
        Icon(
          Icons.arrow_back_ios,
          size: pSh(context: context, percentage: .02),
          color: Colors.transparent,
        ),
      ],
    )
        .padding(horizontal: pSh(context: context, percentage: .015))
        .width(pSw(context: context));
  }
}
