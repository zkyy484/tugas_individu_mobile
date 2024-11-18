import 'package:flutter/material.dart';
import 'package:project_individu/models/model_tampilan.dart';
import 'package:project_individu/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => KehadiranProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ModelTampilan(),
      ),
    ),
  );
}
