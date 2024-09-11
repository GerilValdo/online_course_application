import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_course_application/screen/log_in_page.dart';

import '../widgets/form_register.dart';
import '../widgets/background_wave1_appbar.dart';
import '../widgets/background_wave2_appbar.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const routeName = '/register-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper1(),
            child: Container(
              height: 150,
              color: Colors.green,
            ),
          ),
          ClipPath(
            clipper: WaveClipper2(),
            child: Container(
              height: 150,
              color: Colors.lightGreen,
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 100),
                Title(
                    color: Colors.green,
                    child: Text(
                      'Buat Akun',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )),
                SizedBox(height: 30),
                FormRegister(),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LogInPage.routeName);
                  },
                  child: Text(
                    'DAFTAR',
                    style: TextStyle(fontSize: 40),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[400],
                      foregroundColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 5)),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                      text: 'Sudah Punya Akun? ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Masuk',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                  context, LogInPage.routeName);
                            },
                        )
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
