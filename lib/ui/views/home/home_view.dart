import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oscar/ui/common/app_colors.dart';
import 'package:oscar/ui/common/data.dart';
import 'package:oscar/ui/common/ui_helpers.dart';
import 'package:oscar/ui/widgets/ShopsListItem.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../widgets/CustomAppBar.dart';
import '../../widgets/CustomTabSwitcher.dart';
import '../../widgets/DropDownButton.dart';
import '../../widgets/OfferesListItem.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceMedium,
            CustomAppBar(),
            verticalSpaceMedium,
            CustomTabSwitcher(
              onTap: () {
                viewModel.changeTab();
              },
              selectedTab: viewModel.selectedTab,
            ),
            verticalSpaceMedium,
            verticalSpaceMedium,
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: Image.asset('assets/images/gradientImage.png'),
                  height: pSh(context: context, percentage: .3),
                  width: pSw(context: context, percentage: .3),
                ).positioned(
                    left: -pSh(context: context, percentage: .02),
                    bottom: -pSh(context: context, percentage: .04)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    verticalSpaceMedium,
                    verticalSpaceMedium,
                    viewModel.selectedTab == 0
                        ? ListView.builder(
                            itemCount: offersModels.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return OfferesListItem(
                                offre: offersModels[index],
                              );
                            },
                          )
                            .width(pSw(context: context, percentage: 1))
                            .padding(
                                horizontal:
                                    pSh(context: context, percentage: .01))
                            .expanded()
                        : ListView.builder(
                            itemCount: shopsModels.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return ShopsListItem(
                                shops: shopsModels[index],
                              );
                            },
                          ).width(pSw(context: context)).expanded(),
                  ],
                ),
                DropDownButton(
                  items: viewModel.items,
                  selectedValue: viewModel.selectedValue,
                  isListOpen: viewModel.isListOpen,
                  onTap: () {
                    viewModel.changeList();
                  },
                  ontabClicked: () {
                    viewModel.changeList();
                  },
                ).positioned(),
              ],
            ).expanded(),
          ],
        ).safeArea().padding(all: pSh(context: context, percentage: .01)));
  }

// pSh is a function you can find it iun common/ui_helpers that gives us a good aspect ration for responsivness
  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
