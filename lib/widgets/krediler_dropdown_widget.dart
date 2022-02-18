import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../helper/data_helper.dart';

class KredilerDropDownWidget extends StatefulWidget {
  final Function onSelectKredi;
  const KredilerDropDownWidget({required this.onSelectKredi, Key? key})
      : super(key: key);

  @override
  _KredilerDropDownWidgetState createState() => _KredilerDropDownWidgetState();
}

class _KredilerDropDownWidgetState extends State<KredilerDropDownWidget> {
  int secilenKredi = 10;
  @override
  Widget build(BuildContext context) {
    print("krediler dropdown widget çalıştı");
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<int>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade300,
        value: secilenKredi,
        items: DataHelper.kredilerMenuItem(),
        underline: Container(),
        onChanged: (deger) {
          setState(() {
            secilenKredi = deger!;
            widget.onSelectKredi(deger);
            print(deger);
          });
        },
      ),
    );
  }
}
