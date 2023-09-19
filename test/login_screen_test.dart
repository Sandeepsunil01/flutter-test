import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/login_screen.dart';

void main() {
  group("Login Screen Test Cases", () {
    testWidgets("Should have a title", (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder title = find.byKey(const ValueKey("app_bar_key"));

      // Assert
      expect(title, findsOneWidget);
    });

    testWidgets("Should have one text field form to collect user emailId",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder userNameTextField = find.byKey(const ValueKey("email_id"));

      // Assert
      expect(userNameTextField, findsOneWidget);
    });

    testWidgets("Shoule have one test field form to collect user password",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder passwordTextField = find.byKey(const ValueKey("password"));

      // Assert
      expect(passwordTextField, findsOneWidget);
    });

    testWidgets("Should have an Login Button", (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder loginButton = find.byType(ElevatedButton);

      // Assert
      expect(loginButton, findsOneWidget);
    });

    testWidgets(
        "Should Show required field error message if user email id & password is empty",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();
      Finder errorText = find.text("Required Field");

      // Assert
      expect(errorText, findsNWidgets(2));
    });

    testWidgets("Should show validation error for user email and password",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder emailText = find.byKey(const ValueKey("email_id"));
      Finder passwordText = find.byKey(const ValueKey("password"));
      await widgetTester.enterText(emailText, "asjdhfuds");
      await widgetTester.enterText(passwordText, "sdjsd");

      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();
      Finder emailError = find.text("Please enter valid Email Id");
      Finder passwordError = find.text("Password is short");

      // Assert
      expect(emailError, findsOneWidget);
      expect(passwordError, findsOneWidget);
    });

    testWidgets("Should submit form when user email id and password is valid",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      // Act
      Finder emailText = find.byKey(const ValueKey("email_id"));
      Finder passwordText = find.byKey(const ValueKey("password"));

      await widgetTester.enterText(emailText, "abc@somewhere.com");
      await widgetTester.enterText(passwordText, "kjshdiusaiu");

      Finder loginButton = find.byType(ElevatedButton);
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();
      Finder errorMessage = find.text("Required Field");

      expect(errorMessage, findsNothing);
    });
  });
}
