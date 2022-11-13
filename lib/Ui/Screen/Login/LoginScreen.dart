// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sendtoget/Common/Utils/TextStyles.dart';
import 'package:sendtoget/Common/Utils/Utils.dart';
import 'package:sendtoget/Common/Widget/Custom.dart';
import 'package:sendtoget/Contants/StringContants.dart';
import 'package:sendtoget/Data/Model/ThemeModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModel themeNotifer, child) {
        return Scaffold(
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Welcome,
                    style: TextStyles.BigHeaderTextStyles,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    AppName,
                    style: TextStyles.SmallHeaderTextStyles,
                  ),
                  SizedBox(height: Utils.getHeight(context) * 0.1),
                  const Text(
                    Login,
                    style: TextStyles.BigHeaderTextStyles,
                  ),
                  SizedBox(height: Utils.getHeight(context) * 0.2),
                  CustomTextField(
                    height: 50.0,
                    color: Colors.red,
                    controller: _phoneController,
                    hintText: HitNumber,
                    themeModel: themeNotifer,
                    prefix: const Text(
                      '+91\t\t',
                      style: TextStyles.SmallHeaderTextStyles,
                    ),
                  ),
                  CustomTextField(
                    height: 50.0,
                    color: Colors.red,
                    controller: _passController,
                    hintText: HitPssword,
                    themeModel: themeNotifer,
                    prefix: const Text(
                      '+91\t\t',
                      style: TextStyles.SmallHeaderTextStyles,
                    ),
                  ),
                  SizedBox(height: Utils.getHeight(context) * 0.2),
                  CustomBotton(
                    height: 50,
                    text: "LOG IN",
                    function: () {
                      Navigator.pushNamed(context, '/HomeScreen');
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
