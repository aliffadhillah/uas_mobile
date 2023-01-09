import 'package:flutter/material.dart';
import 'package:localhost_api/api/api_service.dart';

class PengirimanCreate extends StatefulWidget {
  static const routeName = '/pengiriman_create';
  const PengirimanCreate({Key? key}) : super(key: key);

  @override
  State<PengirimanCreate> createState() => _BiodataCreateState();
}

class _BiodataCreateState extends State<PengirimanCreate> {
  String _nama = '';
  String _kelas = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pengiriman Barang'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ketikkan isi barang',
                  labelText: 'Input isi barang',
                ),
                onChanged: (String value) {
                  setState(() {
                    _nama = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Tuliskan tujuan barang',
                  labelText: 'Input tujuan',
                ),
                onChanged: (String value) {
                  setState(() {
                    _kelas = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  ApiService apiService = ApiService();
                  apiService.createBiodata(_nama, _kelas);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ));
  }
}
