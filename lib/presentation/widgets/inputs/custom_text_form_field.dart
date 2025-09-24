import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final bool? obscureText;
  final String? hintText;
  final String? errorMessage;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(30));
    return TextFormField(
      obscureText: obscureText!,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        isDense: true,
        label: label != null ? Text(label!) : null,
        focusColor: colors.primary,
        errorText: errorMessage,
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
