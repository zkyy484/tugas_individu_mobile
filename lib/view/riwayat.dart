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
          title: Text(
            'Riwayat Kehadiran',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: provider.riwayatKehadiran.isEmpty
            ? Center(
                child: Text(
                  'Belum ada riwayat kehadiran.',
                  style: TextStyle(fontSize: 18),
                ),
              )

            //membuat daftar riwayat secara dinamis berdasarkan jumlah data yang ada pada riwayatKehadiran
            : ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                itemCount: provider.riwayatKehadiran.length,
                itemBuilder: (context, index) {
                  final history = provider.riwayatKehadiran[index];
                  final date = history['date'] as DateTime;

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,

                        // menampilkan widget yang bersifat text/tittle
                        child: ListTile(
                          title: Text(
                            'Tanggal: ${date.day}-${date.month}-${date.year}',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            'Hadir: ${history['presentCount']}, Tidak Hadir: ${history['absentCount']}',
                          ),
                        )
                      ),
                  );
                }
              )
            );
  }
}
