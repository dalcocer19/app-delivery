import 'package:flutter/material.dart';

import '../../models/user.dart';
import '../../utils/shared_pref.dart';

class RolesController {

  BuildContext? context;
  VoidCallback? refresh;

  User? user;
  SharedPref sharedPref = SharedPref();

  Future<void> init(BuildContext context, VoidCallback refresh) async{
    this.context = context;
    this.refresh = refresh;

    user = User.fromJson(await sharedPref.read('user'));
    refresh();
  }

  void goToPage(String route) {
    Navigator.pushNamedAndRemoveUntil(context!, route, (route) => false);
  }
}