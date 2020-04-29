import 'package:flutter/cupertino.dart';

class ModelHud extends ChangeNotifier{
  bool isShown = false;
  changeIsShow(bool value)
  {
    isShown = value;
    notifyListeners();
  }
}