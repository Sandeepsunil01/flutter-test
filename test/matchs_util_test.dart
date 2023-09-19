import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/maths_utils.dart';

void main() {
  // I have used group
  group("This performs simple test cases written in match_util file", () {
    test("Check for 2 number addition", () {
      // Arrange
      int a = 10;
      int b = 10;

      // Act
      int sum = add(a, b);

      // Assert
      expect(sum, 20);
    });

    test("Check for 2 number Substract ", () {
      // Arrange
      int a = 20;
      int b = 10;

      // Act
      int difference = subtract(a, b);

      // Assert
      expect(difference, 10);
    });

    test("Check for 2 number multiplication", () {
      // Arrange
      int a = 10;
      int b = 10;

      // Act
      int value = multiply(a, b);

      // Assert
      expect(value, 100);
    });
  });
}
