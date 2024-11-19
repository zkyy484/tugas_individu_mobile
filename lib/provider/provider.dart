// import 'package:flutter/material.dart';

// // menyimpan data kehadiran, mencatat riwayat, serta memberikan notifikasi
// class KehadiranProvider with ChangeNotifier {
//   final List<Map<String, dynamic>> students = [
//     {'name': 'Moch. Dzaky Musyaddad', 'present': false},
//     {'name': 'Diny Yusro', 'present': false},
//     {'name': 'Farozan Ali Fahmi', 'present': false},
//     {'name': 'Sayidati Fauziah', 'present': false},
//     {'name': 'Syamsul Hadi', 'present': false},
//     {'name': 'Sri Nur Hayati', 'present': false},
//   ];

//   // menyimpan data kehadiran siswa pada sebuah Map
//   final List<Map<String, dynamic>> riwayatKehadiran = [];

//   // Menyimpan jumlah siswa yang telah melakukan presensi serta mereset status presensi
//   void saveKehadiran() {

//     // Menyimpan jumlah siswa yang telah melakukan presensi
//     final int presentCount = students.where((s) => s['present']).length;
//     final int absentCount = students.length - presentCount;

//     // Simpan data ke dalam riwayat (fungsi dari insert 0 digunakan agar data yang dimasukkan selalu berada di atas)
//     // riwayatkehadiran menyimpan jumlah dari siswa yang melakukan absen dan tidak
//     riwayatKehadiran.insert(0, {
//       'date': DateTime.now(),
//       'presentCount': presentCount,
//       'absentCount': absentCount,
//     });

//     // Reset kehadiran siswa
//     // for (var student in students) {
//     //   student['present'] = false;
//     // }

//     // notifikasi untuk mengetahui apakah sudah terhubung dengan provider serta memperbarui tampilan ketika terjadi perubahan
//     notifyListeners();
//   }
// }

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

  // menyimpan data kehadiran siswa pada sebuah Map
  final List<Map<String, dynamic>> riwayatKehadiran = [];

  // Menyimpan jumlah siswa yang telah melakukan presensi serta mereset status presensi
  void saveKehadiran() {
    // Menyimpan jumlah siswa yang telah melakukan presensi
    final presentStudents = students
        .where((student) => student['present'])
        .map((student) => student['name'] as String)
        .toList();

    // Menyimpan jumlah siswa yang tidak melakukan present
    final absentStudents = students
        .where((student) => !student['present'])
        .map((student) => student['name'] as String)
        .toList();

    // Menyimpan total submit
    final int presentCount = presentStudents.length;
    final int absentCount = absentStudents.length;

    // Simpan data ke dalam riwayat
    riwayatKehadiran.insert(0, {
      'date': DateTime.now(),
      'presentCount': presentCount,
      'absentCount': absentCount,
      'presentStudents': presentStudents,
      'absentStudents': absentStudents,
    });

    // Reset kehadiran siswa
    for (var student in students) {
      student['present'] = false;
    }

    // Notifikasi perubahan
    notifyListeners();
  }
}
