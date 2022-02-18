import 'package:flutter/material.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/constant/app_constant.dart';
import 'package:flutter_dinamik_ortalama_hesaplama/helper/data_helper.dart';

import '../model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onMyDismiss;
  const DersListesi({required this.onMyDismiss, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (d) {
                  // DataHelper.tumEklenenDersler.removeAt(index);
                  onMyDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].adi),
                      leading: CircleAvatar(
                        child: Text(
                          (tumDersler[index].harfDegeri *
                                  tumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi, Not değeri ${tumDersler[index].harfDegeri} "),
                    ),
                  ),
                ),
              );
            },
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Lütfen ders ekleyiniz.",
                  style: Sabitler.baslikStyle,
                ),
              ),
            ],
          );
  }
}
