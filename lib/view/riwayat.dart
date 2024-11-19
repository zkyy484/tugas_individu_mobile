import 'package:flutter/material.dart';
import 'package:project_individu/provider/provider.dart';
import 'package:provider/provider.dart';

// menampilkan riwayat kehadiran siswa dalam bentuk daftar menggunakan data  yang didapat dari KehadiranProvider
class HalamanRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // mengambil nilai data dari KehadiranProvider
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Riwayat Kehadiran',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: provider.riwayatKehadiran.isEmpty
          ? const Center(
              child: Text(
                'Belum ada riwayat kehadiran.',
                style: TextStyle(fontSize: 18),
              ),
            )

          // membuat daftar riwayat secara dinamis berdasarkan jumlah data yang ada pada riwayatKehadiran
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              itemCount: provider.riwayatKehadiran.length,
              itemBuilder: (context, index) {
                final history = provider.riwayatKehadiran[index];
                final date = history['date'] as DateTime;

                // menampilkan widget yang bersifat dinamis
                return Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: ExpansionTile(
                  title: Text(
                    'Tanggal: ${date.day}-${date.month}-${date.year}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    'Hadir: ${history['presentCount']} | Tidak Hadir: ${history['absentCount']}',
                  ),
                  children: [
                    // Detail siswa yang hadir
                    ListTile(
                      title: const Text('Siswa Hadir:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (history['presentStudents'] as List<String>)
                            .map((student) => Text('• $student'))
                            .toList(),
                      ),
                    ),

                    // Detail siswa yang tidak hadir
                    ListTile(
                      title: const Text('Siswa Tidak Hadir:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: (history['absentStudents'] as List<String>)
                            .map((student) => Text('• $student'))
                            .toList(),
                      ),
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
