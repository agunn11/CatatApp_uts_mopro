import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_catattugasmu/loginpage.dart';

void main() {
  testWidgets(
      'LoginPage has a title, login button and navigation to Forgot Password page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: const LoginPage(),
    ));

    // Verifikasi bahwa judul "To-Do List" ada di layar
    expect(find.text('To-Do List'), findsOneWidget);

    // Verifikasi bahwa tombol login ada di layar
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verifikasi bahwa tombol "Lupa Kata Sandi?" ada di layar
    expect(find.byType(TextButton), findsOneWidget);
  });

  testWidgets('Login fails with incorrect username or password',
      (WidgetTester tester) async {
    // Build aplikasi dan trigger frame.
    await tester.pumpWidget(MaterialApp(
      home: const LoginPage(),
    ));

    // Masukkan username dan password yang salah
    await tester.enterText(find.byType(TextField).at(0), 'incorrectUser');
    await tester.enterText(find.byType(TextField).at(1), 'wrongPassword');

    // Ketuk tombol login
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifikasi bahwa dialog error muncul
    expect(find.text('Login Gagal'), findsOneWidget);
  });

  testWidgets('Navigate to Forgot Password page', (WidgetTester tester) async {
    // Build aplikasi dan trigger frame.
    await tester.pumpWidget(MaterialApp(
      home: const LoginPage(),
    ));

    // Ketuk tombol "Lupa Kata Sandi?"
    await tester.tap(find.byType(TextButton));
    await tester.pumpAndSettle();
  });
}
