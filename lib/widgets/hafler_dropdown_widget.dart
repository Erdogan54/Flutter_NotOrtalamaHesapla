import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import '../helper/data_helper.dart';

class HarflerDropDown extends StatefulWidget {
  final Function onSelectHarf;
  const HarflerDropDown({required this.onSelectHarf, Key? key})
      : super(key: key);

  @override
  _HarflerDropDownState createState() => _HarflerDropDownState();
}

class _HarflerDropDownState extends State<HarflerDropDown> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    print("harfler dropdown widget çalıştı");
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade300,
        value: secilenHarfDegeri,
        items: DataHelper.menuItemler(),
        underline: Container(),
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onSelectHarf(deger);
            print(deger);
          });
        },
      ),
    );
  }
}
