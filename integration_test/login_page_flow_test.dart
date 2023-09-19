import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("This Tests Login Screen Flow", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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
      await widgetTester.pumpAndSettle(const Duration(seconds: 5));
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
      await widgetTester.pumpAndSettle(const Duration(seconds: 5));
      Finder emailError = find.text("Please enter valid Email Id");
      Finder passwordError = find.text("Password is short");

      // Assert
      expect(emailError, findsOneWidget);
      expect(passwordError, findsOneWidget);
    });

    testWidgets("Shoudld show home screen when user Logs In",
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
      await widgetTester.pumpAndSettle(const Duration(seconds: 5));

      Finder homeScreenText = find.textContaining("Welcome !!!");

      // Assert
      expect(homeScreenText, findsOneWidget);
    });
  });
}
