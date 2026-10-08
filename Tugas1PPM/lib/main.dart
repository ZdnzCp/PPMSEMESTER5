import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPM Sesi 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF087E75),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F6F3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF087E75),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: const MyHomePage(title: 'PPM Sesi 1 - Muhammad Zaidan Yazid Ilmani (20240040184)'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter == 0) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(content: Text('Angka tidak boleh kurang dari 0')),
        );
      return;
    }

    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEven = _counter.isEven;
    final numberColor = isEven
        ? const Color(0xFF087E75)
        : const Color(0xFFE27A38);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xFFDCEFEB),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFF087E75),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _IdentityLine(label: 'Nama', value: 'Muhammad Zaidan Yazid Ilmani'),
                          SizedBox(height: 7),
                          _IdentityLine(label: 'NIM', value: '20240040184'),
                          SizedBox(height: 7),
                          _IdentityLine(
                            label: 'Prodi/Kelas',
                            value: 'Teknik Informatika/TI24G',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'COUNTER',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF65716D),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '$_counter',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: numberColor,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              isEven ? 'Angka Genap' : 'Angka Ganjil',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: numberColor,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filledTonal(
                  onPressed: _decrementCounter,
                  tooltip: 'Kurangi',
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 18),
                FilledButton.tonalIcon(
                  onPressed: _resetCounter,
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Reset'),
                ),
                const SizedBox(width: 18),
                IconButton.filled(
                  onPressed: _incrementCounter,
                  tooltip: 'Tambah',
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _IdentityLine extends StatelessWidget {
  const _IdentityLine({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.bodyMedium,
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: value),
        ],
      ),
    );
  }
}