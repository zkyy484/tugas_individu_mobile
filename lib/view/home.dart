import 'package:flutter/material.dart';
import 'package:project_individu/provider/provider.dart';
import 'package:provider/provider.dart';

class HalamanKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil data pada class kehadiran provider
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pencatatan Kehadiran',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            // Mengatur list data secara dinamis
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (context, index) {
                final student = provider.students[index];


                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 5,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      title: Text(
                        student['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      trailing: Checkbox(
                        value: student['present'],
                        
                        // Dipanggil ketika terjadi perubahan nilai present pada siswa dan memperbarui UInya
                        onChanged: (value) {
                          student['present'] = value!;
                          provider.notifyListeners();
                        },
                      ),
                    ),
                  ),
                ); 




              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: provider.students.isEmpty
                  ? null
                  : () {
                      // Memanggil saveKehadiran untuk menyimpan kehadiran ke dalam riwayatKehadiran
                      provider.saveKehadiran();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kehadiran berhasil disimpan!')),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Simpan Kehadiran',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

