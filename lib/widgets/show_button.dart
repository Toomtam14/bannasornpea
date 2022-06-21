// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bannasornpea/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowButton extends StatelessWidget {
  final String label;
  final Function() pressFunc;
  const ShowButton({
    Key? key,
    required this.label,
    required this.pressFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        primary: MyConstant.primary,
      ),
      onPressed: pressFunc,
      child: Text(label),
    );
  }
}
