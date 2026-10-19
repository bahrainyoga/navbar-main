import 'package:flutter/material.dart';

class LacakPesananScreen extends StatelessWidget {
  const LacakPesananScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Lacak Pesanan', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          // Info Resi Card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(10),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.local_shipping_rounded, color: Colors.blue, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'J&T Express',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade800),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'No. Resi: JP88291029384',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy_rounded, color: Colors.grey),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nomor resi disalin!'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Timeline List
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
              ),
              child: ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  _buildTimelineItem(
                    title: 'Pesanan Telah Diterima',
                    subtitle: 'Paket telah diterima oleh yang bersangkutan.',
                    time: '12 Okt 2026, 14:30',
                    isLast: false,
                    isDone: true,
                    isActive: true,
                  ),
                  _buildTimelineItem(
                    title: 'Pesanan Sedang Dikirim',
                    subtitle: 'Kurir sedang menuju ke alamat tujuan Anda.',
                    time: '12 Okt 2026, 09:15',
                    isLast: false,
                    isDone: true,
                  ),
                  _buildTimelineItem(
                    title: 'Pesanan Telah Sampai di Hub Sortir',
                    subtitle: 'Paket sedang disortir di fasilitas logistik Jakarta.',
                    time: '11 Okt 2026, 22:45',
                    isLast: false,
                    isDone: true,
                  ),
                  _buildTimelineItem(
                    title: 'Pesanan Dikemas',
                    subtitle: 'Penjual sedang mempersiapkan pesanan Anda.',
                    time: '11 Okt 2026, 10:20',
                    isLast: false,
                    isDone: true,
                  ),
                  _buildTimelineItem(
                    title: 'Pesanan Dibuat',
                    subtitle: 'Pembayaran telah diverifikasi.',
                    time: '11 Okt 2026, 09:00',
                    isLast: true,
                    isDone: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String subtitle,
    required String time,
    required bool isLast,
    required bool isDone,
    bool isActive = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Indikator Garis & Titik
        Column(
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : (isDone ? Colors.blue.shade300 : Colors.grey.shade300),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                boxShadow: isActive ? [
                  BoxShadow(color: Colors.blue.withAlpha(100), blurRadius: 8, spreadRadius: 2),
                ] : null,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 65,
                color: isDone ? Colors.blue.shade300 : Colors.grey.shade200,
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Konten Timeline
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: isActive ? Colors.blue : (isDone ? Colors.black87 : Colors.grey),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: isActive ? Colors.black87 : Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}