import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:introduccion_hello_world/src/pages/login/login_controller.dart';
import 'package:introduccion_hello_world/src/utils/my_colors.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final LoginController _con = LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circleLogin()
            ),
            Positioned(
              child: _textLogin(),
              top: 60,
              left: 25,
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  _lottieAnimation(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _textDontHaveAccount()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      'LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: const EdgeInsets.only(
          top: 150,
          bottom: 70
      ),
      child: Lottie.asset(
        'assets/json/AnimationDelivery.json',
        width: 350,
        height: 200,
        fit: BoxFit.fill
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: const EdgeInsets.only(
          top: 100,
          bottom: 70
      ),
      child: Image.asset(
        'assets/img/delivery.png',
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'Correo electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(
            color: Color(0xFFA7001C)
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Color(0xFFE70D32)
          )
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        decoration: const InputDecoration(
            hintText: 'Contrasenia',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: Color(0xFFA7001C)
            ),
            prefixIcon: Icon(
                Icons.lock,
                color: Color(0xFFE70D32)
            )
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: _con.login,
        child: const Text(
          'Ingresar',
          style: TextStyle(color: Color(0xFFFAFAF6)),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15)
        )

      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
            'No tienes cuenta?',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            )
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: _con.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            ),
          ),
        )
      ],
    );
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor
      ),
    );
  }
}
