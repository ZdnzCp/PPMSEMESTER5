import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      title: 'NusaBookstore',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: themeProvider.themeMode,
      home: const CatalogScreen(),
    );
  }
}

/// Light mode: nuansa pastel (pink, lavender, krem).
ThemeData _lightTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFB39DDB),
    brightness: Brightness.light,
  ).copyWith(
    primary: const Color(0xFFB39DDB), // lavender pastel
    onPrimary: const Color(0xFF2E2150),
    primaryContainer: const Color(0xFFE8DEFF), // lavender muda
    onPrimaryContainer: const Color(0xFF4A3B78),
    secondary: const Color(0xFFFFB5C8), // pink pastel
    onSecondary: const Color(0xFF4A1F2E),
    secondaryContainer: const Color(0xFFFFDDE7),
    onSecondaryContainer: const Color(0xFF5C2A3B),
    surface: const Color(0xFFFFFFFF),
    onSurface: const Color(0xFF3A3150),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: const Color(0xFFFFF1F6), // pink krem
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE8DEFF),
      foregroundColor: Color(0xFF3A3150),
      elevation: 0,
      centerTitle: true,
    ),
  );
}

/// Dark mode: nuansa biru tua (navy).
ThemeData _darkTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFF1E3A8A),
    brightness: Brightness.dark,
  ).copyWith(
    primary: const Color(0xFF6FA8FF),
    onPrimary: const Color(0xFF06142E),
    primaryContainer: const Color(0xFF1F3F73),
    onPrimaryContainer: const Color(0xFFCFE0FF),
    secondary: const Color(0xFF8FB4F5),
    onSecondary: const Color(0xFF06142E),
    secondaryContainer: const Color(0xFF263F6B),
    onSecondaryContainer: const Color(0xFFD6E4FF),
    surface: const Color(0xFF14294F),
    onSurface: const Color(0xFFE8EEFB),
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: const Color(0xFF0B1B3A), // biru tua
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0F2347),
      foregroundColor: Color(0xFFE8EEFB),
      elevation: 0,
      centerTitle: true,
    ),
  );
}
