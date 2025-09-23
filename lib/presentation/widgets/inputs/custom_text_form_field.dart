import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      // borderSide: BorderSide(color: colors.primary),
    );
    return TextFormField(
      onChanged: (value) {
        print(value);
      },
      validator: (value) {
        if (value == null) {
          return 'Campo es requerido';
        }
      },
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: colors.primary),
        ),
      ),
    );
  }
}
