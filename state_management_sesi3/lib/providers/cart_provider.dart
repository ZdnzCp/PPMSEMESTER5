import 'package:flutter/foundation.dart';

import '../models/book.dart';

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});

  int get subtotal => book.price * quantity;
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  /// Daftar buku di keranjang (read-only).
  List<CartItem> get items => List.unmodifiable(_items);

  /// Menambahkan buku, atau menambah jumlah jika buku sudah ada.
  void addItem(Book book) {
    final index = _items.indexWhere((item) => item.book.id == book.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(book: book));
    }
    notifyListeners();
  }

  /// Mengurangi jumlah buku, dan menghapusnya jika jumlah mencapai 0.
  void removeItem(Book book) {
    final index = _items.indexWhere((item) => item.book.id == book.id);
    if (index < 0) return;

    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    } else {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  /// Mengosongkan keranjang.
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  /// Jumlah seluruh buku (akumulasi quantity).
  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);

  /// Total harga seluruh buku.
  int get totalPrice => _items.fold(0, (sum, item) => sum + item.subtotal);
}
