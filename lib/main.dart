import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constant/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/ortalama_hesapla_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dinamik Ortalama Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Sabitler.anaRenk,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: OrtalamaHesaplaPage()
    );
  }
}
