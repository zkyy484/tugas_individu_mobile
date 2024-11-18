import 'package:flutter/material.dart';
import 'package:project_individu/view/home.dart';
import 'package:project_individu/view/riwayat.dart';

class ModelTampilan extends StatefulWidget {
  @override
  _ModelTampilanState createState() => _ModelTampilanState();
}

// menampilkan halaman utama karena fungsi selected bernilai 0
class _ModelTampilanState extends State<ModelTampilan> {
  int _selectedIndex = 0;

  // menyimpan daftar widget/data yang akan ditampilkan ketika menekan tombol bottom
  final List<Widget> _pages = [
    HalamanKehadiran(),
    HalamanRiwayat(),
  ];

  // memilih indeks item yang dipilih(memperbarui tampilan/body akan berubah sesuai dengan data yang baru)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // metode utama untuk membangun tampilan widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,

        // menentukan item yang sedang aktif
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white
        ),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Pencatatan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
        ],
      ),
    );
  }
}
