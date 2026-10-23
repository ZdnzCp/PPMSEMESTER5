// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nusa_travel/main.dart';

void main() {
  testWidgets('Splash screen adapts to compact and wide viewports', (
    WidgetTester tester,
  ) async {
    for (final size in [const Size(320, 568), const Size(1200, 800)]) {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(const NusaTravelApp());
      await tester.pumpAndSettle();

      expect(find.text('Nusa Travel'), findsOneWidget);
      expect(find.text('Mulai Eksplorasi'), findsOneWidget);
      expect(tester.takeException(), isNull);
    }

    await tester.binding.setSurfaceSize(null);
  });
}
