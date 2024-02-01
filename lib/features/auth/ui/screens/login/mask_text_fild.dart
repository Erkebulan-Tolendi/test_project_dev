import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String mask;
  final String hintText;
  final TextInputType keyboardType;

  const MaskedTextField({
    Key? key,
    required this.controller,
    required this.mask,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: mask,
      filter: {"#": RegExp(r'[0-9]')},
    );

    return TextField(
      controller: controller,
      inputFormatters: [maskFormatter],
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        fillColor: Colors.white,
        filled: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        errorMaxLines: 1,
      ),
    );
  }
}
