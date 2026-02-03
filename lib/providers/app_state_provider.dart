import 'package:flutter/material.dart';

enum Major { engineering, medicine }

class AppStateProvider extends ChangeNotifier {
  Major? _selectedMajor;
  int _currentNavIndex = 0;

  Major? get selectedMajor => _selectedMajor;
  int get currentNavIndex => _currentNavIndex;

  void selectMajor(Major major) {
    _selectedMajor = major;
    notifyListeners();
  }

  void setNavIndex(int index) {
    _currentNavIndex = index;
    notifyListeners();
  }

  String get dashboardRoute {
    if (_selectedMajor == Major.engineering) {
      return '/engineering-dashboard';
    } else if (_selectedMajor == Major.medicine) {
      return '/medicine-dashboard';
    }
    return '/onboarding';
  }
}
