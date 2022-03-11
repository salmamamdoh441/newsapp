import 'package:flutter/cupertino.dart';

class CountryProv extends ChangeNotifier
{
  String country='eg';

  onChanged(v){
    country=v;
    notifyListeners();
  }
}