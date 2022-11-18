import 'package:flutter/material.dart';

import 'text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final IconButton? suffixIcon;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const RoundedInputField({
    Key? key,
    this.hintText = '',
    this.icon = Icons.person,
    required this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    required this.validator,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        // cursorColor: Constants.PRIMARY_COLOR,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFA1A4B2)),
          suffixIcon: suffixIcon != null ? suffixIcon : null,
          border: InputBorder.none,
        ),
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
