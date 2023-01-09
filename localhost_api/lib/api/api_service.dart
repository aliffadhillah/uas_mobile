import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:localhost_api/model/pengiriman_read.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/pengiriman_api/api/';

  Future<PengirimanRead> getBiodata() async {
    final response = await http.get(Uri.parse("${baseUrl}bagian/read.php"));
    if (response.statusCode == 200) {
      return PengirimanRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createBiodata(String isi_barang, String tujuan) async {
    final response = await http.post(
      Uri.parse("${baseUrl}bagian/create.php"),
      body: jsonEncode(<String, String>{
        'isi_barang': isi_barang,
        'tujuan': tujuan,
      }),
    );
    return response;
  }
}
