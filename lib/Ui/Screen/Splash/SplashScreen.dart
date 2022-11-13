// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sendtoget/Common/Images/Images.dart';
import 'package:sendtoget/Common/Utils/Utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/LoginScreen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.getHeight(context),
      width: Utils.getWidth(context),
      alignment: Alignment.center,
      child: Image.asset(
        Images.logo,
        height: Utils.getHeight(context),
        width: Utils.getHeight(context),
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
