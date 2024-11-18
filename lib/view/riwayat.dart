import 'package:flutter/material.dart';
import 'package:project_individu/provider/provider.dart';
import 'package:provider/provider.dart';

class HalamanRiwayat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Riwayat Kehadiran',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
      ),
      body: provider.riwayatKehadiran.isEmpty
          ? Center(
              child: Text(
                'Belum ada riwayat kehadiran.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              itemCount: provider.riwayatKehadiran.length,
              itemBuilder: (context, index) {
                final history = provider.riwayatKehadiran[index];
                final date = history['date'] as DateTime;
                return ListTile(
                  title: Text(
                    'Tanggal: ${date.day}-${date.month}-${date.year}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  subtitle: Text(
                    'Hadir: ${history['presentCount']}, Tidak Hadir: ${history['absentCount']}',
                  ),
                );
              },
            ),
    );
  }
}

