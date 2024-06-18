import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:introduccion_hello_world/src/utils/shared_pref.dart';

class ClientProductsListController {
  BuildContext? context;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  Future? init(BuildContext context) {
    this.context = context;
  }

  logout() {
    _sharedPref.logout(context!);
  }

  void openDrawer() {
    key.currentState?.openDrawer();
  }
}