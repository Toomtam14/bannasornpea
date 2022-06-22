import 'dart:io';

import 'package:bannasornpea/states/authen.dart';
import 'package:flutter/material.dart';

void main() {

  HttpOverrides.global = MyHttpOvrride();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Authen(),
    );
  }
}

class MyHttpOvrride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
