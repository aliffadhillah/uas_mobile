import 'package:flutter/material.dart';
import 'package:localhost_api/api/api_service.dart';
import 'package:localhost_api/model/pengiriman.dart';
import 'package:localhost_api/model/pengiriman_read.dart';
import 'package:localhost_api/screen/pengiriman_create.dart';

class PengirimanList extends StatefulWidget {
  static const routeName = '/pengiriman_list';

  const PengirimanList({Key? key}) : super(key: key);

  @override
  State<PengirimanList> createState() => _BiodataListState();
}

class _BiodataListState extends State<PengirimanList> {
  late Future<PengirimanRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getBiodata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengiriman Barang'),
      ),
      body: Center(
        child: FutureBuilder<PengirimanRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Kirim> biodatas = snapshot.data!.kirims;
                return ListView.builder(
                    itemCount: biodatas.length,
                    itemBuilder: (context, index) {
                      return _buildPengirimanCard(context, biodatas[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, PengirimanCreate.routeName);
        },
      ),
    );
  }

  Widget _buildPengirimanCard(BuildContext context, Kirim pengiriman) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        pengiriman.isi_barang,
      ),
      subtitle: Text(
        pengiriman.tujuan,
      ),
    );
  }
}
