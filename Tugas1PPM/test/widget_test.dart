// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas1ppm/main.dart';

void main() {
  testWidgets('PPM counter updates parity and resets', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.text(
        'PPM Sesi 1 - Muhammad Zaidan Yazid Ilmani (20240040184)',
      ),
      findsOneWidget,
    );
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Angka Genap'), findsOneWidget);
    expect(find.text('Nama: Muhammad Zaidan Yazid Ilmani'), findsOneWidget);
    expect(find.text('NIM: 20240040184'), findsOneWidget);
    expect(
      find.text('Prodi/Kelas: Teknik Informatika/TI24G'),
      findsOneWidget,
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Angka Ganjil'), findsOneWidget);

    await tester.tap(find.text('Reset'));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Angka Genap'), findsOneWidget);
  });

  testWidgets('counter does not decrement below zero', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Angka Genap'), findsOneWidget);
    expect(find.text('Angka tidak boleh kurang dari 0'), findsOneWidget);
  });
}
