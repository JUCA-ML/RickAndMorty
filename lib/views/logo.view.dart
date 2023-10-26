import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/utils/global.colors.dart';
import 'package:login/views/login.view.dart';

class LogoView extends StatelessWidget {
  const LogoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(LoginView());
    });
    return Scaffold(
      backgroundColor: GlobalColors.mainColor,
      body: const Center(
        child: Text(
          'JUCA APP',
          style: TextStyle(
            color: Colors.white,
            fontSize:35,
            fontWeight: FontWeight.bold, 
          ),),
      ),
    );
  }
}