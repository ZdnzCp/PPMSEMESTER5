import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/cart_provider.dart';
import '../providers/theme_provider.dart';
import 'cart_screen.dart';

const List<Book> _books = [
  Book(
    id: 'b1',
    title: 'Soichi: Junji Ito Story Collection',
    author: 'Junji Ito',
    price: 185000,
  ),
  Book(
    id: 'b2',
    title: 'Tomie: Complete Deluxe Edition',
    author: 'Junji Ito',
    price: 450000,
  ),
  Book(
    id: 'b3',
    title: 'Look Back',
    author: 'Tatsuki Fujimoto',
    price: 95000,
  ),
  Book(
    id: 'b4',
    title: 'Uzumaki',
    author: 'Junji Ito',
    price: 320000,
  ),
  Book(
    id: 'b5',
    title: 'Chainsaw Man Vol. 1',
    author: 'Tatsuki Fujimoto',
    price: 75000,
  ),
  Book(
    id: 'b6',
    title: 'Laut Bercerita',
    author: 'Leila S. Chudori',
    price: 110000,
  ),
  Book(
    id: 'b7',
    title: 'Bumi Manusia',
    author: 'Pramoedya Ananta Toer',
    price: 125000,
  ),
];

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NusaBookstore',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // Tombol Light/Dark Mode
          Consumer<ThemeProvider>(
            builder: (context, theme, _) {
              return IconButton(
                tooltip: theme.isDarkMode ? 'Mode terang' : 'Mode gelap',
                icon: Icon(
                  theme.isDarkMode
                      ? Icons.light_mode_rounded
                      : Icons.dark_mode_rounded,
                ),
                onPressed: () => context.read<ThemeProvider>().toggleTheme(),
              );
            },
          ),
          // Ikon keranjang + badge jumlah item
          Consumer<CartProvider>(
            builder: (context, cart, _) {
              return IconButton(
                tooltip: 'Keranjang',
                icon: Badge(
                  isLabelVisible: cart.totalItems > 0,
                  label: Text('${cart.totalItems}'),
                  child: const Icon(Icons.shopping_cart_rounded),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _books.length,
        itemBuilder: (context, index) => _BookCard(book: _books[index]),
      ),
    );
  }
}

class _BookCard extends StatelessWidget {
  final Book book;

  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      color: scheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder cover buku
            Container(
              width: 72,
              height: 100,
              decoration: BoxDecoration(
                color: scheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.menu_book_rounded,
                size: 36,
                color: scheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(book.author),
                  const SizedBox(height: 8),
                  Text(
                    formatRupiah(book.price),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: scheme.onPrimaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    icon: const Icon(Icons.add_shopping_cart_rounded, size: 18),
                    label: const Text('Tambah ke Keranjang'),
                    onPressed: () {
                      context.read<CartProvider>().addItem(book);
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text('"${book.title}" ditambahkan'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
