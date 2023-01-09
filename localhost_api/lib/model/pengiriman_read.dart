import 'package:localhost_api/model/pengiriman.dart';

class PengirimanRead {
  PengirimanRead({required this.success, required this.kirims});

  bool success;
  List<Kirim> kirims;

  factory PengirimanRead.fromJson(Map<String, dynamic> json) => PengirimanRead(
      success: json['success'],
      kirims: List<Kirim>.from(json['data'].map((x) => Kirim.fromJson(x))));
}
