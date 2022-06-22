// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:bannasornpea/models/user_model.dart';
import 'package:bannasornpea/states/my_service.dart';
import 'package:bannasornpea/utility/my_constant.dart';
import 'package:bannasornpea/utility/my_dialog.dart';
import 'package:bannasornpea/widgets/show_button.dart';
import 'package:bannasornpea/widgets/show_form.dart';
import 'package:bannasornpea/widgets/show_image.dart';
import 'package:bannasornpea/widgets/show_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  State<Authen> createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool redEye = true;
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints boxConstraints) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusScopeNode());
          },
          child: Container(
            decoration: MyConstant().bgBox(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  newLogo(boxConstraints),
                  newTitle(boxConstraints),
                  formUser(boxConstraints),
                  formPassword(boxConstraints),
                  buttomLogin(boxConstraints),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Container buttomLogin(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: boxConstraints.maxWidth * 0.4,
      child: ShowButton(
        label: 'LOGIN',
        pressFunc: () {
          print('user = $user, password = $password');

          if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            print('Have Space');
            MyDialog(context: context).normalDialog(
                title: 'Have Space ?', subTitle: 'Please Fill Every Blank');
          } else {
            print('No Space');
            processCheckLogin();
          }
        },
      ),
    );
  }

  Container formPassword(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 40,
      width: boxConstraints.maxWidth * 0.6,
      child: ShowForm(
        redEyeFunc: () {
          setState(() {
            redEye = !redEye;
          });
        },
        obSecu: redEye,
        hint: 'Password :',
        iconData: Icons.electric_meter,
        changeFung: (String string) {
          password = string.trim();
        },
      ),
    );
  }

  Container formUser(BoxConstraints boxConstraints) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: boxConstraints.maxWidth * 0.6,
      height: 40,
      child: ShowForm(
        hint: 'User :',
        iconData: Icons.bolt_outlined,
        changeFung: (String string) {
          user = string.trim();
        },
      ),
    );
  }

  SizedBox newTitle(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          ShowText(
            text: 'Login :',
            textStyle: MyConstant().h1Style(),
          ),
        ],
      ),
    );
  }

  SizedBox newLogo(BoxConstraints boxConstraints) {
    return SizedBox(
      width: boxConstraints.maxWidth * 0.6,
      child: Row(
        children: [
          SizedBox(width: boxConstraints.maxWidth * 0.25, child: ShowImage()),
        ],
      ),
    );
  }

  Future<void> processCheckLogin() async {
    String path =
        'https://www.androidthai.in.th/egat/getUserWhereUserTam.php?isAdd=true&user=$user';

    await Dio().get(path).then((value) {
      print('value ==> $value');

      if (value.toString() == 'null') {
        MyDialog(context: context).normalDialog(
            title: 'User False', subTitle: 'No $user in my Database');
      } else {
        var result = json.decode(value.data);
        print('result ==> $result');

        for (var element in result) {
          UserModel userModel = UserModel.fromMap(element);
          if (password == userModel.password) {
            MyDialog(context: context).normalDialog(
                pressFunc: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();

                  var data = <String>[];
                  data.add(userModel.id);
                  data.add(userModel.name);
                  data.add(userModel.position);

                  preferences.setStringList('data', data).then((value) {
                     Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyService(),
                      ),
                      (route) => false);
                  });
                },
                label: 'Go to Service',
                title: 'Welcome to App',
                subTitle: 'Login Success Welcome ${userModel.name}');
          } else {
            MyDialog(context: context).normalDialog(
                title: 'Password False', subTitle: "Please Try Again");
          }
        }
      }
    });
  }
}
