import 'package:flutter/material.dart';
import 'package:login/utils/global.colors.dart';
import 'package:login/views/widguets/button.global.dart';
import 'package:login/views/widguets/text.form.global.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[

                const SizedBox(height: 20),

                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'LOGN IN',
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ///Entrada del Email
                Text(
                  'Inicia Sesión',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),

                TextFormGlobal(controller: emailController, 
                text: 'Usuario', 
                obscure: false, 
                textInputType: TextInputType.emailAddress,),

                const SizedBox(height: 10),

                ///Entrada Password
                TextFormGlobal(
                  controller: passController, 
                  text: 'Contraseña', 
                  textInputType: TextInputType.text, 
                  obscure: true
                ),

                const SizedBox(height: 10),

                const ButtonGlobal(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}