import 'package:oscar/app/app.bottomsheets.dart';
import 'package:oscar/app/app.dialogs.dart';
import 'package:oscar/app/app.locator.dart';
import 'package:oscar/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  int _selectedTab = 0;
  int get selectedTab => _selectedTab;
  String? _selectedValue = '';
  String get selectedValue => _selectedValue!;
  bool? _isListOpen = false;
  bool get isListOpen => _isListOpen!;
  final List<Map> items = [
    {
      'icon': 'assets/images/arrow.svg',
      'text': 'par distance',
    },
    {
      'icon': 'assets/images/star.svg',
      'text': 'par popularité',
    },
    {
      'icon': 'assets/images/fire.svg',
      'text': 'par nouveauté',
    },
  ];

  changeTab() {
    _selectedTab == 0 ? _selectedTab = 1 : _selectedTab = 0;
    rebuildUi();
  }

  changeList() {
    _isListOpen == true ? _isListOpen = false : _isListOpen = true;
    rebuildUi();
  }

  closeList() {
    _isListOpen == false;
    rebuildUi();
  }
}
