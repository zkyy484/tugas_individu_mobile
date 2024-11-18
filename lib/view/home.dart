import 'package:flutter/material.dart';
import 'package:project_individu/provider/provider.dart';
import 'package:provider/provider.dart';

class HalamanKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pencatatan Kehadiran',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (context, index) {
                final student = provider.students[index];
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  title: Text(student['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.w600
                  ),),
                  trailing: Checkbox(
                    value: student['present'],
                    onChanged: (value) {
                      student['present'] = value!;
                      provider.notifyListeners();
                    },
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
                      provider.saveAttendance();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kehadiran berhasil disimpan!')),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              child: Text('Simpan Kehadiran',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal
              ),),
            ),
          ),
        ],
      ),
    );
  }
}