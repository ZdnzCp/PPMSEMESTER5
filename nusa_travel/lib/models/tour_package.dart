class TourPackage {
  final int id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;

  const TourPackage({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  /// Contoh: 2500000 -> "Rp 2.500.000"
  String get formattedPrice => formatRupiah(price);
}

/// Hasil pemesanan yang dikembalikan lewat Navigator.pop()
class BookingResult {
  final TourPackage package;
  final String name;
  final int participants;
  final DateTime date;

  const BookingResult({
    required this.package,
    required this.name,
    required this.participants,
    required this.date,
  });

  int get totalPrice => package.price * participants;
}

String formatRupiah(int value) {
  final digits = value.toString().replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'),
        (match) => '.',
      );
  return 'Rp $digits';
}

String formatDate(DateTime d) {
  const months = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
  ];
  return '${d.day} ${months[d.month - 1]} ${d.year}';
}

/// Data dummy paket wisata
const List<TourPackage> tourPackages = [
  TourPackage(
    id: 1,
    title: 'Pesona Bali 3 Hari 2 Malam',
    description:
        'Nikmati keindahan Pantai Kuta, Tanah Lot, Ubud, dan Pura Uluwatu. '
        'Sudah termasuk hotel bintang 4, transportasi, dan pemandu wisata lokal.',
    price: 3500000,
    imageUrl:
        'https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800',
  ),
  TourPackage(
    id: 2,
    title: 'Eksotis Raja Ampat 4 Hari',
    description:
        'Snorkeling dan diving di surga bawah laut Raja Ampat, island hopping, '
        'serta melihat langsung Pianemo. Termasuk penginapan dan makan.',
    price: 8900000,
    imageUrl:
        'https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?w=800',
  ),
  TourPackage(
    id: 3,
    title: 'Jelajah Bromo & Ijen 3 Hari',
    description:
        'Menikmati sunrise Bromo, lautan pasir, dan fenomena blue fire '
        'Kawah Ijen. Termasuk jeep, homestay, dan tiket masuk.',
    price: 2750000,
    imageUrl:
        'https://images.unsplash.com/photo-1588668214407-6ea9a6d8c272?w=800',
  ),
  TourPackage(
    id: 4,
    title: 'Labuan Bajo & Pulau Komodo',
    description:
        'Berlayar dengan kapal phinisi, trekking ke Pulau Padar, bertemu '
        'komodo, dan berenang di Pink Beach selama 3 hari 2 malam.',
    price: 6200000,
    imageUrl:
        'https://images.unsplash.com/photo-1571366343168-631c5bcca7a4?w=800',
  ),
  TourPackage(
    id: 5,
    title: 'Wisata Budaya Yogyakarta',
    description:
        'Mengunjungi Candi Borobudur, Keraton, Taman Sari, dan menikmati '
        'kuliner khas Malioboro bersama pemandu berpengalaman.',
    price: 1850000,
    imageUrl:
        'https://images.unsplash.com/photo-1584810359583-96fc3448beaa?w=800',
  ),
];
