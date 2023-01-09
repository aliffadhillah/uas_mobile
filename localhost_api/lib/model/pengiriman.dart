class Kirim {
  String id;
  String isi_barang;
  String tujuan;

  Kirim({required this.id, required this.isi_barang, required this.tujuan});

  factory Kirim.fromJson(Map<String, dynamic> kirim) => Kirim(
      id: kirim['id'],
      isi_barang: kirim['isi_barang'],
      tujuan: kirim['tujuan']);
}
