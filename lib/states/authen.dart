// ignore_for_file: avoid_print

import 'package:bannasornpea/utility/my_constant.dart';
import 'package:bannasornpea/utility/my_dialog.dart';
import 'package:bannasornpea/widgets/show_button.dart';
import 'package:bannasornpea/widgets/show_form.dart';
import 'package:bannasornpea/widgets/show_image.dart';
import 'package:bannasornpea/widgets/show_text.dart';
import 'package:flutter/material.dart';

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
}
