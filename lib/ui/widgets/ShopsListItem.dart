import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oscar/ui/widgets/CustomText.dart';
import 'package:styled_widget/styled_widget.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class ShopsListItem extends StatelessWidget {
  ShopsListItem({
    Key? key,
    required this.shops,
  }) : super(key: key);
  Map<String, dynamic>? shops;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container()
                .decorated(
                    image: DecorationImage(
                        image: AssetImage(shops!['image']), fit: BoxFit.cover))
                .height(pSh(context: context, percentage: .12))
                .width(pSw(context: context, percentage: 1))
                .clipRRect(
                  topLeft: pSh(context: context, percentage: .02),
                  topRight: pSh(context: context, percentage: .02),
                ),
            Container()
                .decorated(
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/294_pizza_hut_new_logo 1 (1).png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.circle)
                .height(pSh(context: context, percentage: .08))
                .width(pSw(context: context, percentage: .08))
                .positioned(
                    top: 0, left: pSh(context: context, percentage: .01)),
            Row(
              children: [
                shops!['check'] == true
                    ? SvgPicture.asset(
                        'assets/images/Vector-2.svg',
                        height: pSh(context: context, percentage: .033),
                      )
                    : Container(),
                horizontalSpaceTiny,
                shops!['like'] == true
                    ? SvgPicture.asset(
                        'assets/images/Group 106.svg',
                        height: pSh(context: context, percentage: .035),
                      )
                    : Container(),
                horizontalSpaceTiny,
                shops!['dollar'] == true
                    ? SvgPicture.asset(
                        'assets/images/Vector.svg',
                        height: pSh(context: context, percentage: .033),
                      )
                    : Container(),
                horizontalSpaceTiny,
                horizontalSpaceTiny,
              ],
            ).positioned(
                right: 0, bottom: -pSh(context: context, percentage: .02)),
            ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.3),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                pSh(context: context, percentage: .015)))),
                    height: pSh(context: context, percentage: .04),
                    width: pSw(context: context, percentage: .5),
                    child: Row(
                      children: [
                        horizontalSpaceMedium,
                        CustomText(
                          text: shops!['name'],
                          color: kcTextColor,
                          weight: FontWeight.bold,
                        ).alignment(Alignment.centerLeft),
                      ],
                    ),
                  )),
            ).positioned(left: 0, bottom: 0),
          ],
        ),
        Spacer(),
        verticalSpaceTiny,
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/menu.svg',
              height: pSh(context: context, percentage: .018),
            ),
            horizontalSpaceSmall,
            CustomText(
              text: 'Restaurant',
              weight: FontWeight.w500,
              color: Color(0xff808080),
              size: pSh(context: context, percentage: .013),
            ),
            horizontalSpaceSmall,
            SvgPicture.asset(
              'assets/images/location.svg',
              height: pSh(context: context, percentage: .018),
            ),
            horizontalSpaceSmall,
            CustomText(
              text: shops!['place'],
              weight: FontWeight.w500,
              color: Color(0xff808080),
              size: pSh(context: context, percentage: .013),
            ),
            horizontalSpaceTiny,
            SvgPicture.asset(
              'assets/images/Ellipse 258.svg',
              height: pSh(context: context, percentage: .007),
            ),
            horizontalSpaceTiny,
            // horizontalSpaceTiny,
            CustomText(
              text: shops!['distance'],
              weight: FontWeight.w500,
              color: Color(0xff808080),
              size: pSh(context: context, percentage: .012),
            ),
          ],
        ).padding(horizontal: pSh(context: context, percentage: .012)),
        verticalSpaceSmall,
        Row(
          children: [
            shops!['antiGasp'] != false
                ? Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/globe.svg',
                        height: pSh(context: context, percentage: .018),
                      ),
                      horizontalSpaceSmall,
                      CustomText(
                        text: 'Anti-gasp',
                        weight: FontWeight.w500,
                        color: Color(0xff808080),
                        size: pSh(context: context, percentage: .011),
                      ),
                      horizontalSpaceSmall,
                    ],
                  )
                    .padding(all: pSh(context: context, percentage: .006))
                    .decorated(
                        border: Border.all(color: Color(0xFFCACACA)),
                        borderRadius: BorderRadius.circular(
                            pSh(context: context, percentage: .019)))
                : Row().padding(all: pSh(context: context, percentage: .015)),
            horizontalSpaceSmall,
            shops!['livraison'] != false
                ? Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/truck.svg',
                        height: pSh(context: context, percentage: .015),
                      ),
                      horizontalSpaceSmall,
                      CustomText(
                        text: 'Livraison',
                        weight: FontWeight.w500,
                        color: Color(0xff808080),
                        size: pSh(context: context, percentage: .013),
                      ),
                    ],
                  )
                    .padding(all: pSh(context: context, percentage: .006))
                    .decorated(
                        border: Border.all(color: Color(0xFFCACACA)),
                        borderRadius: BorderRadius.circular(
                            pSh(context: context, percentage: .019)))
                : Row().padding(all: pSh(context: context, percentage: .015)),
          ],
        ).padding(horizontal: pSh(context: context, percentage: .012)),
        verticalSpaceTiny,
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/persons.svg',
              height: pSh(context: context, percentage: .018),
            ),
            horizontalSpaceSmall,
            CustomText(
              text: shops!['peoples'],
              weight: FontWeight.w500,
              color: Color(0xff808080),
              size: pSh(context: context, percentage: .015),
            ),
            horizontalSpaceSmall,
            Container()
                .height(pSh(context: context, percentage: .017))
                .width(pSw(context: context, percentage: .002))
                .decorated(color: kcTextColor.withOpacity(0.3)),
            horizontalSpaceSmall,
            SvgPicture.asset(
              'assets/images/tag.svg',
              height: pSh(context: context, percentage: .015),
            ),
            horizontalSpaceTiny,
            SvgPicture.asset(
              'assets/images/Ellipse 258.svg',
              height: pSh(context: context, percentage: .007),
            ),
            horizontalSpaceTiny,
            SvgPicture.asset(
              'assets/images/twoCirccels.svg',
              height: pSh(context: context, percentage: .015),
            ),
            horizontalSpaceTiny,
            SvgPicture.asset(
              'assets/images/Ellipse 258.svg',
              height: pSh(context: context, percentage: .007),
            ),
            horizontalSpaceTiny,
            SvgPicture.asset(
              'assets/images/fourthPart.svg',
              height: pSh(context: context, percentage: .015),
            ),
            horizontalSpaceSmall,
            Container()
                .height(pSh(context: context, percentage: .017))
                .width(pSw(context: context, percentage: .002))
                .decorated(color: kcTextColor.withOpacity(0.3)),
            horizontalSpaceSmall,
            SvgPicture.asset(
              'assets/images/persons.svg',
              height: pSh(context: context, percentage: .018),
            ),
            horizontalSpaceSmall,
            CustomText(
              text: 'Communauté',
              weight: FontWeight.w500,
              color: Color(0xff808080),
              size: pSh(context: context, percentage: .013),
            ),
            Spacer(),
            Icon(
              Icons.star_rounded,
              color: Color(0xFFFFC529),
              size: pSh(context: context, percentage: .018),
            ),
            horizontalSpaceTiny,
            CustomText(
              text: shops!['rating'],
              weight: FontWeight.w600,
              color: kcTextColor,
              size: pSh(context: context, percentage: .016),
            ),
          ],
        ).padding(all: pSh(context: context, percentage: .012))
      ],
    )
        .width(pSw(context: context))
        .height(pSh(context: context, percentage: .24))
        .decorated(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.09),
                spreadRadius: 5,
                blurRadius: 22,
                offset: Offset(0, 15), // changes position of shadow
              ),
            ],
            borderRadius:
                BorderRadius.circular(pSh(context: context, percentage: .02)))
        .padding(
            bottom: pSh(context: context, percentage: .03),
            horizontal: pSh(context: context, percentage: .015));
  }
}
