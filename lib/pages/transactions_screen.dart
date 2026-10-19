import 'package:flutter/material.dart';
import 'package:mysample/pages/nilai_produk_screen.dart';
import 'lacak_pesanan_screen.dart';
import 'tanya_penjual_screen.dart';
import 'detail_transaksi_screen.dart';
import '../data/dummy/dummy_transaksi.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  void nilaiProduk(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NilaiProdukScreen()),
    );
  }

  void lacakPesanan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LacakPesananScreen()
      ),
    );
  }

  void tanyaPenjual(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TanyaPenjualScreen()
      ),
    );
  }

  void pindahDetailTransaksi(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailTransaksiScreen()
      ),
    );
  }

  String formatRupiah(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (match) => '${match.group(1)}.')}';
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'Selesai':
        return Colors.green;
      case 'Dikirim':
        return Colors.blue;
      case 'Dikemas':
        return Colors.orange;
      case 'Diproses':
        return Colors.purple;
      case 'Dibatalkan':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String getButtonText(String status) {
    switch (status) {
      case 'Selesai':
        return 'Nilai';
      case 'Dikirim':
        return 'Lacak';
      case 'Dikemas':
        return 'Tanya Penjual';
      case 'Diproses':
        return 'Tanya Penjual';
      case 'Dibatalkan':
        return 'Beli Lagi';
      default:
        return 'Detail';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transaksi')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final item = transactions[index];

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Tanggal & Status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.tanggal,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: getStatusColor(item.status).withAlpha(25),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: getStatusColor(item.status).withAlpha(150),
                          ),
                        ),
                        child: Text(
                          item.status,
                          style: TextStyle(
                            fontSize: 12,
                            color: getStatusColor(item.status),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Divider(),

                  const SizedBox(height: 12),

                  // Produk
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(item.foto, fit: BoxFit.cover),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.nama,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              '1 barang',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Divider(),

                  const SizedBox(height: 12),

                  // Total & Detail
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Belanja',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),

                          const SizedBox(height: 4),

                          Text(
                            formatRupiah(item.harga),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      ElevatedButton(
                        onPressed: () {
                          switch (item.status) {
                            case 'Selesai':
                              nilaiProduk(context);
                              break;

                            case 'Dikirim':
                              lacakPesanan(context);
                              break;

                            case 'Diproses':
                              tanyaPenjual(context);
                              break;

                            case 'Dibatalkan':
                              pindahDetailTransaksi(context);
                              break;

                            default:
                              pindahDetailTransaksi(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          getButtonText(item.status),
                          // dikirim : lacak
                          // dikemas : chat penjual
                          // selesai : nilai
                          // di batalkan : beli lagi
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
