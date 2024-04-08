import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:inbank_frontend/api_service.dart';
import 'package:test/test.dart';

void main() {
  group('ApiService', () {
    late ApiService apiService;

    test('requestLoanDecision returns a valid decision', () async {
      final mockClient = MockClient((request) async {
        final response = {
          'loanAmount': 10000,
          'loanPeriod': 12,
          'errorMessage': 'null',
        };
        return http.Response(jsonEncode(response), 200);
      });
      apiService = ApiService(client: mockClient);

      const personalCode = '50307172740';
      const loanAmount = 10000;
      const loanPeriod = 12;

      final result = await apiService.requestLoanDecision(
          personalCode, loanAmount, loanPeriod);

      expect(result, isA<Map<String, String>>());
      expect(result['loanAmount'], '10000');
      expect(result['loanPeriod'], '12');
      expect(result['errorMessage'], '');
    });

    test('requestLoanDecision returns an error message', () async {
      final mockClient = MockClient((request) async {
        final response = {
          'loanAmount': 'null',
          'loanPeriod': 'null',
          'errorMessage': 'Loan application denied',
        };
        return http.Response(jsonEncode(response), 400);
      });

      apiService = ApiService(client: mockClient);

      const personalCode = '50307172740';
      const loanAmount = 50000;
      const loanPeriod = 24;

      final result = await apiService.requestLoanDecision(
          personalCode, loanAmount, loanPeriod);

      expect(result, isA<Map<String, String>>());
      expect(result['loanAmount'], '0');
      expect(result['loanPeriod'], '0');
      expect(result['errorMessage'], 'Loan application denied');
    });
  });
}
