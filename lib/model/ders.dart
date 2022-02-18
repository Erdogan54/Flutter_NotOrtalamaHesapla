class Ders {
  final String adi;
  final double harfDegeri;
  final int krediDegeri;

  Ders(
      {required this.adi, required this.harfDegeri, required this.krediDegeri});

  @override
  String toString() {
    // TODO: implement toString
    return "Ders Adı: $adi Harf Degeri: $harfDegeri Kredi Degeri: $krediDegeri";
  }
}
