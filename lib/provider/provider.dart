import 'package:flutter/material.dart';

// menyimpan data kehadiran, mencatat riwayat, serta memberikan notifikasi
class KehadiranProvider with ChangeNotifier {
  final List<Map<String, dynamic>> students = [
    {'name': 'Moch. Dzaky Musyaddad', 'present': false},
    {'name': 'Diny Yusro', 'present': false},
    {'name': 'Farozan Ali Fahmi', 'present': false},
    {'name': 'Sayidati Fauziah', 'present': false},
    {'name': 'Syamsul Hadi', 'present': false},
    {'name': 'Sri Nur Hayati', 'present': false},
  ];

  // menyimpan data kehadiran siswa
  final List<Map<String, dynamic>> riwayatKehadiran = [];

  void saveAttendance() {
    // Menyimpan jumlah siswa yang telah melakukan presensi
    final int presentCount = students.where((s) => s['present']).length;
    final int absentCount = students.length - presentCount;

    // Simpan data ke dalam riwayat
    riwayatKehadiran.insert(0, {
      'date': DateTime.now(),
      'presentCount': presentCount,
      'absentCount': absentCount,
    });

    // Reset kehadiran siswa
    // for (var student in students) {
    //   student['present'] = false;
    // }

    // notifikasi untuk mengetahui apakah sudah terhubung dengan provider
    notifyListeners();
  }
}
