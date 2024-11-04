import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/login_screen/login_view_model.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mockito/annotations.dart';

import 'login_view_model_test.mocks.dart';

@GenerateMocks([BuildContext, LoginService])
void main() {
  group('LoginViewModel', () {
    late LoginViewModel loginViewModel;
    late MockLoginService mockLoginService;

    setUp(() {
      mockLoginService = MockLoginService();
      loginViewModel = LoginViewModel(mockLoginService, SortOrder.ascending);
    });

    group('onDigitPressed', () {
      test(
          'given inputted pin is empty when digit is pressed then inputted pin should be added',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());
        loginViewModel.onDigitPressed(2, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        // Act
        loginViewModel.onDigitPressed(1, MockBuildContext());

        // Assert
        expect(loginViewModel.inputtedPin, '1231');
      }, tags: 'unit');

      test(
          'given inputted pin is 6 digits when digit is pressed then inputted pin should not be added',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());
        loginViewModel.onDigitPressed(2, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        // Act
        loginViewModel.onDigitPressed(1, MockBuildContext());

        // Assert
        expect(loginViewModel.inputtedPin, '123333');
      }, tags: 'unit');
      group('FE pin validation', () {});
      group('handle network call', () {});
    });
    group('onDeleteButtonPressed', () {
      test(
          'given inputted pin is not empty when delete button is click then last digit from inputtedPin will be removed',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());
        loginViewModel.onDigitPressed(2, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        // Act
        loginViewModel.onDeleteButtonPressed();

        // Assert
        expect(loginViewModel.inputtedPin, '12333');
      }, tags: 'unit');

      test(
          'given inputted pin is not empty when delete button is click then last digit from inputtedPin will be removed',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());
        // Act
        loginViewModel.onDeleteButtonPressed();

        // Assert
        expect(loginViewModel.inputtedPin, '');
      }, tags: 'unit');

      test(
          'given inputted pin is not empty when delete button is click then last digit from inputtedPin will be removed',
          () {
        // Arrange

        // Act
        loginViewModel.onDeleteButtonPressed();

        // Assert
        expect(loginViewModel.inputtedPin, '');
      }, tags: 'unit');
    });

    group('navigation', () {});
  });
}
