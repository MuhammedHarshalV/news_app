import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/models/Allnews.dart';
import 'package:news_app/services/apiservices.dart';

class Newses with ChangeNotifier {
  List<Article> tophedline = [];
  bool isloading = false;
  Future<void> gettopnews() async {
    isloading = true;
    notifyListeners();
    final newses = await Apiservices.getdata();
    tophedline = newses!.articles ?? [];

    isloading = false;
    notifyListeners();
  }

  Future<void> getcategorynews({required String click}) async {
    isloading = true;
    notifyListeners();
    final newses = await Apiservices.getcategory(category: click);
    tophedline = newses!.articles ?? [];

    isloading = false;
    notifyListeners();
  }
}
