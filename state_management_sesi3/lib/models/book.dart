class Book {
  final String id;
  final String title;
  final String author;
  final int price;

  /// Kosongkan untuk memakai ikon placeholder.
  final String imageUrl;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    this.imageUrl = '',
  });
}

/// Format angka menjadi Rupiah, contoh: 185000 -> "Rp 185.000".
String formatRupiah(int value) {
  final s = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) {
      buffer.write('.');
    }
    buffer.write(s[i]);
  }
  return 'Rp $buffer';
}
