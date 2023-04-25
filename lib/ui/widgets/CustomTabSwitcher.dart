import 'package:flutter/material.dart';
import 'package:oscar/ui/common/app_colors.dart';
import 'package:oscar/ui/common/ui_helpers.dart';
import 'package:oscar/ui/widgets/CustomText.dart';
import 'package:styled_widget/styled_widget.dart';

class CustomTabSwitcher extends StatelessWidget {
  CustomTabSwitcher({
    Key? key,
    required this.onTap,
    required this.selectedTab,
  }) : super(key: key);
  final Function()? onTap;
  int? selectedTab;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Offres',
              size: pSh(context: context, percentage: .015),
              color: Color(0xFFA0A0A0A6),
              weight: FontWeight.w600,
            )
                .center()
                .width(pSw(context: context, percentage: .22))
                .padding(vertical: pSh(context: context, percentage: .007))
                .decorated()
                .gestures(onTap: onTap),
            Container()
                .height(pSh(context: context, percentage: .02))
                .width(pSw(context: context, percentage: .002))
                .decorated(color: kcTextColor.withOpacity(0.3)),
            CustomText(
              text: 'Shops',
              size: pSh(context: context, percentage: .015),
              color: Color(0xFFA0A0A0A6),
              weight: FontWeight.w600,
            )
                .center()
                .width(pSw(context: context, percentage: .22))
                // .padding(vertical: pSh(context: context, percentage: .01))
                .decorated()
                .gestures(onTap: onTap),
          ],
        ),
        CustomText(
          text: selectedTab == 0 ? 'Offres' : 'Shops',
          size: pSh(context: context, percentage: .015),
          color: kcPrimaryColor,
          weight: FontWeight.w600,
        )
            .center()
            .width(pSw(context: context, percentage: .22))
            .padding(vertical: pSh(context: context, percentage: .007))
            .decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    pSh(context: context, percentage: .01)))
            .alignment(
                selectedTab == 0 ? Alignment.centerLeft : Alignment.centerRight,
                animate: true)
            .animate(const Duration(milliseconds: 800),
                Curves.fastLinearToSlowEaseIn),
      ],
    )
        .width(pSw(context: context, percentage: .55))
        .padding(
            vertical: pSh(context: context, percentage: .005),
            horizontal: pSh(context: context, percentage: .01))
        .decorated(
            color: kcBackgroundColor,
            borderRadius:
                BorderRadius.circular(pSh(context: context, percentage: .015)));
  }
}
