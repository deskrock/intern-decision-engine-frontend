// This file defines a `LoanForm` widget which is a stateful widget
// that displays a loan application form.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inbank_frontend/fonts.dart';
import 'package:inbank_frontend/widgets/national_id_field.dart';

import '../api_service.dart';
import '../colors.dart';

// LoanForm is a StatefulWidget that displays a loan application form.
class LoanForm extends StatefulWidget {
  const LoanForm({Key? key}) : super(key: key);

  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();
  String _nationalId = '';
  int _loanAmount = 2500;
  int _loanPeriod = 36;
  int _loanAmountResult = 0;
  int _loanPeriodResult = 0;
  String _errorMessage = '';

  // Submit the form and update the state with the loan decision results.
  // Only submits if the form inputs are validated.
  void _submitForm() async {
    if (_formKey.currentState!.validate() == false) {
      return;
    }

    final result = await _apiService.requestLoanDecision(
        _nationalId, _loanAmount, _loanPeriod);
    setState(() {
      int parsedAmount = int.parse(result['loanAmount'].toString());
      int parsedPeriod = int.parse(result['loanPeriod'].toString());

      if (parsedAmount <= _loanAmount || parsedPeriod > _loanPeriod) {
        _loanAmountResult = parsedAmount;
        _loanPeriodResult = parsedPeriod;
      } else {
        _loanAmountResult = _loanAmount;
        _loanPeriodResult = _loanPeriod;
      }
      _errorMessage = result['errorMessage'].toString();
    });
  }

  // Builds the application form widget.
  // The widget automatically queries the endpoint for the latest data
  // when a field is changed.
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final formWidth = screenWidth / 3;
    const minWidth = 500.0;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: max(minWidth, formWidth),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  FormField<String>(
                    builder: (state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NationalIdTextFormField(
                            onChanged: (value) {
                              setState(() {
                                _nationalId = value ?? '';
                                _submitForm();
                              });
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 60.0),
                  Text('Loan Amount: $_loanAmount €'),
                  const SizedBox(height: 8),
                  Slider.adaptive(
                    value: _loanAmount.toDouble(),
                    min: 2000,
                    max: 10000,
                    divisions: 80,
                    label: '$_loanAmount €',
                    activeColor: AppColors.secondaryColor,
                    onChanged: (double newValue) {
                      setState(() {
                        _loanAmount = ((newValue.floor() / 100).round() * 100);
                        _submitForm();
                      });
                    },
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('2000€')),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('10000€'),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Text('Loan Period: $_loanPeriod months'),
                  const SizedBox(height: 8),
                  Slider.adaptive(
                    value: _loanPeriod.toDouble(),
                    min: 12,
                    max: 60,
                    divisions: 40,
                    label: '$_loanPeriod months',
                    activeColor: AppColors.secondaryColor,
                    onChanged: (double newValue) {
                      setState(() {
                        _loanPeriod = ((newValue.floor() / 6).round() * 6);
                        _submitForm();
                      });
                    },
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('12 months')),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 12),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('60 months'),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Column(
            children: [
              Text(
                  'Approved Loan Amount: ${_loanAmountResult != 0 ? _loanAmountResult : "--"} €'),
              const SizedBox(height: 8.0),
              Text(
                  'Approved Loan Period: ${_loanPeriodResult != 0 ? _loanPeriodResult : "--"} months'),
              Visibility(
                  visible: _errorMessage != '',
                  child: Text(_errorMessage, style: errorMedium))
            ],
          ),
        ],
      ),
    );
  }
}
