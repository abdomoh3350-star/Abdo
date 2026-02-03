import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:questlearn/main.dart';

void main() {
  testWidgets('QuestLearn app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const QuestLearnApp());

    // Verify that the app starts with the onboarding screen
    expect(find.text('Welcome to QuestLearn'), findsOneWidget);
  });
}
