import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled6/main.dart';  // 將 "your_app_name" 替換為你的應用程序名稱


void main() {
  testWidgets('MyApp has a title and launches the app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the title is correct.
    expect(find.text('Flutter Calculator'), findsOneWidget);

    // You can add more tests here to verify app behavior.

  });
}

