import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oscar/ui/widgets/CustomText.dart';
import 'package:styled_widget/styled_widget.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class OfferesListItem extends StatelessWidget {
  OfferesListItem({
    Key? key,
    required this.offre,
  }) : super(key: key);
  Map<String, dynamic>? offre;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container()
                .decorated(
                    image: DecorationImage(
                        image: AssetImage(offre!['image']), fit: BoxFit.cover))
                .height(pSh(context: context, percentage: .17))
                .width(pSw(context: context, percentage: .33))
                .clipRRect(
                  topLeft: pSh(context: context, percentage: .02),
                  bottomLeft: pSh(context: context, percentage: .02),
                ),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/Rectangle 3.svg',
                  color: offre!['isCoupon'] == true
                      ? Color(0xff9699E9)
                      : offre!['isReduction'] == true
                          ? Color(0xff63D6DD)
                          : Color(0xff4EE489),
                  height: pSh(context: context, percentage: .033),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      offre!['isCoupon'] == true
                          ? 'assets/images/tag.svg'
                          : offre!['isReduction'] == true
                              ? 'assets/images/reduction.svg'
                              : 'assets/images/twoCirccels.svg',
                      height: pSh(context: context, percentage: .016),
                      color: kcBackgroundColor,
                    ),
                    horizontalSpaceTiny,
                    CustomText(
                      text: offre!['isCoupon'] == true
                          ? 'Coupon'
                          : offre!['isReduction'] == true
                              ? offre!['reductionPercentage']
                              : offre!['coins'],
                      weight: FontWeight.w500,
                      color: kcBackgroundColor,
                      size: pSh(context: context, percentage: .014),
                    ),
                  ],
                ).positioned(left: pSh(context: context, percentage: .013))
              ],
            ).positioned(
                top: pSh(context: context, percentage: .02),
                left: -pSh(context: context, percentage: .005)),
            Container()
                .decorated(
                    image: const DecorationImage(
                        image: AssetImage(
                            'assets/images/294_pizza_hut_new_logo 1.png'),
                        fit: BoxFit.contain),
                    shape: BoxShape.circle)
                .height(pSh(context: context, percentage: .08))
                .width(pSw(context: context, percentage: .08))
                .positioned(
                    bottom: 0, left: pSh(context: context, percentage: .01)),
            ClipRRect(
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(0xffFFFFFF).withOpacity(.00000000000000001),
                        Color(0xffFFFFFF).withOpacity(.00000000000001),
                        Color(0xffFFFFFF).withOpacity(.00000000001),
                        Color(0xffFFFFFF).withOpacity(.00000000001),
                      ],
                    )),
                    height: pSh(context: context, percentage: .17),
                    width: pSw(context: context, percentage: .08),
                  )),
            ).positioned(
              right: -pSw(context: context, percentage: .05),
            ),
          ],
        ),
        horizontalSpaceSmall,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            verticalSpaceTiny,
            Row(
              children: [
                CustomText(
                  text: offre!['title'],
                  weight: FontWeight.bold,
                  size: pSh(context: context, percentage: .017),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/images/Bookmark.svg',
                  height: pSh(context: context, percentage: .023),
                ),
                horizontalSpaceSmall,
              ],
            ),
            verticalSpaceSmall,
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/home.svg',
                  height: pSh(context: context, percentage: .018),
                ),
                horizontalSpaceSmall,
                CustomText(
                  text: offre!['place'],
                  weight: FontWeight.w500,
                  color: kcPrimaryColor,
                  size: pSh(context: context, percentage: .015),
                ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/dollar-sign (1).svg',
                  color: Color(0xff808080),
                  height: pSh(context: context, percentage: .018),
                ),
                horizontalSpaceSmall,
                CustomText(
                  text: offre!['price'],
                  weight: FontWeight.w500,
                  color: Color(0xff808080),
                  size: pSh(context: context, percentage: .015),
                ),
                horizontalSpaceMedium,
                // horizontalSpaceSmall,
                offre!['isCoupon'] == true
                    ? SvgPicture.asset(
                        'assets/images/tag.svg',
                        color: Color(0xff808080),
                        height: pSh(context: context, percentage: .015),
                      )
                    : Container(),
                // horizontalSpaceSmall,
                offre!['isReduction'] == true || offre!['isCoins'] == true
                    ? Container()
                        .height(pSh(context: context, percentage: .02))
                        .width(pSw(context: context, percentage: .002))
                        .decorated(color: kcTextColor.withOpacity(0.3))
                    : Container(),
                horizontalSpaceSmall,
                offre!['isCoupon'] == true
                    ? CustomText(
                        text: 'Biscuit offert',
                        weight: FontWeight.w500,
                        color: Color(0xff808080),
                        size: pSh(context: context, percentage: .015),
                      )
                    : CustomText(
                        text: offre!['reductionPrice'],
                        weight: FontWeight.w500,
                        color: Color(0xff808080),
                        size: pSh(context: context, percentage: .015),
                        crossed: true,
                        undeliuned: false,
                      ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/package.svg',
                  color: Color(0xff808080),
                  height: pSh(context: context, percentage: .018),
                ),
                horizontalSpaceSmall,
                CustomText(
                  text: offre!['quantite'] != ''
                      ? offre!['quantite']
                      : 'Offre illimitée',
                  weight: FontWeight.w500,
                  color: Color(0xff808080),
                  size: pSh(context: context, percentage: .015),
                ),
              ],
            ),
            verticalSpaceSmall,
            Row(
              children: [
                SvgPicture.asset(
                  'assets/images/time.svg',
                  color: Color(0xff808080),
                  height: pSh(context: context, percentage: .018),
                ),
                horizontalSpaceSmall,
                CustomText(
                  text: offre!['date'],
                  weight: FontWeight.w500,
                  color: Color(0xff808080),
                  size: pSh(context: context, percentage: .015),
                ),
                Spacer(),
                SvgPicture.asset(
                  'assets/images/Map Icon.svg',
                  color: Color(0xff808080),
                  height: pSh(context: context, percentage: .018),
                ),
                horizontalSpaceSmall,
                CustomText(
                  text: offre!['distance'],
                  weight: FontWeight.w600,
                  color: Color(0xff808080),
                  size: pSh(context: context, percentage: .015),
                ),
                horizontalSpaceSmall,
              ],
            ),
            verticalSpaceTiny
          ],
        ).expanded(),
      ],
    )
        .height(pSh(context: context, percentage: .17))
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
        .padding(bottom: pSh(context: context, percentage: .03));
  }
}
