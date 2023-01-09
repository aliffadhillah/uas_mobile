import 'package:flutter/material.dart';
import 'package:localhost_api/screen/pengiriman_create.dart';
import 'package:localhost_api/screen/pengiriman_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Biodata',
      initialRoute: PengirimanList.routeName,
      routes: {
        PengirimanList.routeName: (context) => const PengirimanList(),
        PengirimanCreate.routeName: (context) => const PengirimanCreate(),
      },
    );
  }
}
