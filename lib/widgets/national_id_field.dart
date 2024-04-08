import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors.dart';

// A custom text form field widget for national ID input
class NationalIdTextFormField extends StatelessWidget {
  // Properties for initial value, on changed event handler and validator function
  final String? initialValue;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const NationalIdTextFormField({
    Key? key,
    this.initialValue,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  // Builds the text form field widget with customized decoration and validation
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(color: AppColors.textColor),
      decoration: const InputDecoration(
        labelText: 'National ID code',
        labelStyle: TextStyle(color: AppColors.textColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.textColor),
        ),
      ),
      cursorColor: AppColors.textColor,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d')),
        LengthLimitingTextInputFormatter(11),
      ],
      keyboardType: TextInputType.number,

      // Rudimentary client side verification of the ID code
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a National ID.';
            }
            if (value.length != 11) {
              return 'National ID is 11 digits long.';
            }
            return null;
          },
      onChanged: onChanged,

      // Set autovalidate mode to trigger validation on user interaction
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
