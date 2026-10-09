// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ppmsesi2/main.dart';

void main() {
  testWidgets('Profile and product are separate navigable pages',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('PPM Sesi 2 - $nama ($nim)'), findsOneWidget);
    expect(find.text(nama), findsOneWidget);
    expect(find.byIcon(Icons.star_rounded), findsNWidgets(5));
    expect(find.text('Headphone Wireless'), findsNothing);

    await tester.tap(find.text('Produk'));
    await tester.pumpAndSettle();
    expect(find.text('Headphone Wireless'), findsOneWidget);
    expect(find.text(nama), findsNothing);

    await tester.tap(find.byTooltip('Tambah ke favorit'));
    await tester.pump();
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    expect(find.text('Elektronik · 9 suka'), findsOneWidget);

    await tester.ensureVisible(find.byTooltip('Kurangi jumlah'));
    await tester.tap(find.byTooltip('Kurangi jumlah'));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.ensureVisible(find.byTooltip('Tambah jumlah'));
    await tester.tap(find.byTooltip('Tambah jumlah'));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Rp 498.000'), findsOneWidget);

    await tester.ensureVisible(find.byKey(const ValueKey('add-to-cart')));
    await tester.tap(find.byKey(const ValueKey('add-to-cart')));
    await tester.pump();
    expect(find.text('Headphone Wireless (2 produk) ditambahkan ke keranjang'),
        findsOneWidget);
  });
}
