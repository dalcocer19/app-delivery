import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduccion_hello_world/src/models/response_api.dart';
import 'package:introduccion_hello_world/src/models/user.dart';
import 'package:introduccion_hello_world/src/provider/users_provider.dart';
import 'package:introduccion_hello_world/src/utils/my_snackbar.dart';
import 'package:introduccion_hello_world/src/utils/shared_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {

  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future? init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});
    print('Usuario: ${user.toJson()}');

    if(user?.sessionToken != null) {
      //Navigator.pushNamedAndRemoveUntil(context, 'client/products/list', (route) => false);
      if(user.roles!.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(context!, '${user.roles![0].route}', (route) => false);
      }
    }
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    ResponseApi? responseApi = await usersProvider.login(email, password);
    print(responseApi?.data);

    if(responseApi?.success != null) {
      User user = User.fromJson(responseApi?.data);
      _sharedPref.save('user', user.toJson());

      print('USUARIO LOGUEADO ${user.toJson()}');
      if(user.roles!.length > 1) {
        Navigator.pushNamedAndRemoveUntil(context!, 'roles', (route) => false);
      }
      else {
        Navigator.pushNamedAndRemoveUntil(context!, '${user.roles![0].route}', (route) => false);

      }
    }else {
      MySnackbar.show(context!, '${responseApi?.message}');
    }
    MySnackbar.show(context!, '${responseApi?.message}');
    print('EMAIL: $email');
    print('PASSWORD: $password');
  }
}