import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inbank_frontend/colors.dart';

// Regular text style
TextStyle bodyMedium = GoogleFonts.openSans(
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  fontStyle: FontStyle.normal,
  height: 1.5,
  textBaseline: TextBaseline.alphabetic,
  color: AppColors.textColor,
);

// Heading text style
TextStyle displayLarge = const TextStyle(
  fontFamily: 'Blacker',
  fontSize: 54.0,
  height: 1.5,
  textBaseline: TextBaseline.alphabetic,
  color: AppColors.textColor,
);

// Error message text style
TextStyle errorMedium = GoogleFonts.openSans(
  fontWeight: FontWeight.w400,
  fontSize: 16.0,
  fontStyle: FontStyle.normal,
  height: 1.5,
  textBaseline: TextBaseline.alphabetic,
  color: AppColors.errorColor,
);
