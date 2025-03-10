import 'package:flutter/material.dart';




class HomeScreenProvider extends ChangeNotifier{
  int tabIndex = 0 ;
  changeTab(int newTabIndex){
    tabIndex = newTabIndex ;
    notifyListeners();
  }
}

