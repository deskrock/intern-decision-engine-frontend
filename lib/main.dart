// This file defines a main function and a widget class `InBankForm`.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inbank_frontend/colors.dart';
import 'package:inbank_frontend/fonts.dart';
import 'package:inbank_frontend/slider_style.dart';
import 'package:inbank_frontend/widgets/loan_form.dart';

// The main function runs the app and shows the `InBankForm` widget.
void main() {
  runApp(const MaterialApp(home: InBankForm()));
}

// This widget builds the loan application form.
class InBankForm extends StatelessWidget {
  const InBankForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final bodyHeight = screenHeight / 1.5;
    const minHeight = 500.0;
    final showText = bodyHeight > minHeight;
    return MaterialApp(
      title: 'Loan Application',
      theme: ThemeData(
          // Set the background color of the scaffold and the text theme.
          scaffoldBackgroundColor: AppColors.primaryColor,
          textTheme: TextTheme(
            displayLarge: displayLarge,
            bodyMedium: bodyMedium,
          ),
          // Set the slider theme, color scheme, and text selection theme.
          sliderTheme: sliderThemeData,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: AppColors.primaryColor)
              .copyWith(secondary: AppColors.secondaryColor)
              .copyWith(error: AppColors.errorColor),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: AppColors.textColor.withOpacity(0.3),
          )),
      home: Scaffold(
        // Center the body and set its height.
        body: Center(
            child: Expanded(
          child: SizedBox(
            height: max(minHeight, bodyHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Show the text if the body height is greater than `minHeight`.
                Visibility(
                  visible: showText,
                  child: Text(
                    'Act. Apply for a loan.',
                    style: displayLarge,
                  ),
                ),
                Visibility(
                    visible: showText, child: const SizedBox(height: 60)),
                const LoanForm(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
