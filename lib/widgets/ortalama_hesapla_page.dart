import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constant/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/model/ders.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/hafler_dropdown_widget.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/krediler_dropdown_widget.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/widgets/ortalama_goster.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  _OrtalamaHesaplaPageState createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  int secilenKredi = 10;
  String girilenDers = "";

  @override
  Widget build(BuildContext context) {
    print("ortalama hesapla widget çalıştı");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                    ortalama: DataHelper.ortalamaHesapla(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              )
            ],
          ),
          Expanded(
            child: DersListesi(
              onMyDismiss: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarflerDropDown(
                    onSelectHarf: (deger) {
                      secilenHarfDegeri = deger;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KredilerDropDownWidget(onSelectKredi: (deger) {
                    secilenKredi = deger;
                  }),
                ),
              ),
              IconButton(
                  onPressed: () {
                    _dersEkleVeOrtalamaHesapla();
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Sabitler.anaRenk,
                    size: 30,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  void _dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          adi: girilenDers,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKredi);

      DataHelper.dersEkle(eklenecekDers);

      setState(() {});
    }
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: ((value) {
        setState(() {
          girilenDers = value!;
        });
      }),
      validator: (deger) {
        if (deger!.length > 0) {
          return null;
        } else {
          return "Lütfen bir ders adı giriniz!";
        }
      },
      decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
          filled: true),
    );
  }

  _buildHarfler() {}

  _buildKrediler() {}
}
