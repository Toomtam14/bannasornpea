// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bannasornpea/utility/my_constant.dart';
import 'package:flutter/material.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changeFung;
  final bool? obSecu;
  final Function()? redEyeFunc;
  const ShowForm({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changeFung,
    this.obSecu,
    this.redEyeFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecu ?? false,
      onChanged: changeFung,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(132, 181, 80, 215).withOpacity(0.1),
        suffixIcon: redEyeFunc == null
            ? Icon(iconData)
            : IconButton(
                onPressed: redEyeFunc,
                icon: Icon(Icons.remove_red_eye),
              ),
        hintText: hint,
        contentPadding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: 16,
        ),
        enabledBorder:
            OutlineInputBorder(
              borderSide: BorderSide(color: MyConstant.dark),
              borderRadius: BorderRadius.circular(12)),
        focusedBorder:
            OutlineInputBorder(
              borderSide: BorderSide(color: MyConstant.active),
              borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
