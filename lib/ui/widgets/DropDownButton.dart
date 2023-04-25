import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oscar/ui/common/app_colors.dart';
import 'package:oscar/ui/widgets/CustomText.dart';
import 'package:styled_widget/styled_widget.dart';

import '../common/ui_helpers.dart';

class DropDownButton extends StatelessWidget {
  DropDownButton({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.isListOpen,
    required this.onTap,
    required this.ontabClicked,
  }) : super(key: key);
  List<Map>? items;
  String? selectedValue;
  bool? isListOpen;
  final Function()? onTap;
  final Function()? ontabClicked;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomText(
              text: selectedValue != '' ? selectedValue : 'Trier',
              size: pSh(context: context, percentage: .016),
              color: Color(0xFF676767),
              weight: FontWeight.bold,
            ),
            horizontalSpaceTiny,
            RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: pSh(context: context, percentage: .018),
              ),
            ),
          ],
        )
            .padding(all: pSh(context: context, percentage: .015))
            .decorated()
            .fittedBox()
            .gestures(onTap: onTap),
        verticalSpaceSmall,
        Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items!
                    .map((e) => Row(
                          children: [
                            SvgPicture.asset(
                              e['icon'],
                              height: pSh(context: context, percentage: .018),
                            ),
                            horizontalSpaceSmall,
                            CustomText(
                              text: e['text'],
                              size: pSh(context: context, percentage: .016),
                              color: Color(0xff676767),
                              weight: FontWeight.w500,
                            ),
                          ],
                        )
                            .padding(
                              all: pSh(context: context, percentage: .01),
                            )
                            .gestures(onTap: ontabClicked))
                    .toList())
            .fittedBox()
            .decorated(
              color: kcBackgroundColor,
              borderRadius: BorderRadius.circular(
                  pSh(context: context, percentage: .015)),
            )
            .opacity(isListOpen == true ? 1 : 0, animate: true)
            .animate(
                Duration(milliseconds: 800), Curves.fastLinearToSlowEaseIn),
      ],
    )
        .width(pSw(context: context, percentage: .4))
        .alignment(Alignment.bottomRight)
        .padding(right: pSh(context: context, percentage: .015));
  }
}
