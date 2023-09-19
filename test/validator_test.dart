import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/validator.dart';

// I am using TDD Approach
// Test Driven Development

void main() {
  group("Check Email Validator Test Cases", () {
    test("Validates Empty Email Id", () {
      // Arrange & Act
      var result = Validator.validateEmail("");

      // Assert
      expect(result, "Required Field");
    });

    test("Validates invalid Email Id", () {
      // Arrange & Act
      var result = Validator.validateEmail("siauhewuhiusdf");

      // Assert
      expect(result, "Please enter valid Email Id");
    });

    test("Validates valid email id", () {
      // Arrange & Act
      var result = Validator.validateEmail("abc@example.com");

      // Assert
      expect(result, null);
    });
  });

  group("Check Password Validator Test Case", () {
    test("Check if Password is Empty", () {
      // Arrange & Act
      var result = Validator.validatePassword('');

      // Assert
      expect(result, "Required Field");
    });

    test("Check if password is short", () {
      // Arrange & Act
      var result = Validator.validatePassword("assd");

      // Assert
      expect(result, "Password is short");
    });

    test("Check if Password is present", () {
      // Arrange & Act
      var result = Validator.validatePassword("hsdiuhsioafj");

      // Assert
      expect(result, null);
    });
  });
}
