import 'package:flutter/material.dart';
import 'package:flutter_dersleri_bolum2/models/veri_model.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa(Key k) : super(key: k);

  @override
  AnaSayfaState createState() {
    return AnaSayfaState();
  }
}

class AnaSayfaState extends State<AnaSayfa> {
  late List<Veri> tumVeriler;

  @override
  void initState() {
    super.initState();
    tumVeriler = [
      Veri(
          'Biz Kimiz',
          'Operasyonel mükemmeliyet ile özel durumlara özel çözümler üreten, Solar enerji konusunda uzman “çözüm ortağınız”.',
          false),
      Veri(
          'Projelerimiz',
          'Bitmeyen enerji kaynağınız Bayraktar Solar Enerji farkıyla ve gururla siz değerli müşterimizle gerçekleştirdiğimiz solar projelerimiz. ',
          false),
      Veri('Misyonumuz', 'Misyonumuz', false),
      Veri('Vizyonumuz', 'Vizyonumuz', false),
      Veri(
          'İletişim / Adresimiz',
          'Merkez/Ofis Adresimiz;Yeni Bati Mah. 2399. sok. no:2 Yenimahalle/Ankara',
          false),
      Veri('Telefon', '0850 303 64 64', false),
      Veri('E-Mail', 'info@bayraktarsolar.com', false),
      Veri('IK E-Mail', 'ik@bayraktarsolar.com', false),
      Veri(
          'Aydınlık Yatırımlara ',
          'Çevreci enerji kaynakları ile doğa dostu elektirik üretimi yapan sizlerin her zaman yanınızdayız',
          false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey('$index'),
          title: Text(tumVeriler[index].baslik),
          initiallyExpanded: tumVeriler[index].expanded,
          children: <Widget>[
            Container(
              color:
                  index % 2 == 0 ? Colors.grey.shade300 : Colors.grey.shade300,
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(tumVeriler[index].icerik),
              ),
            )
          ],
        );
      },
      itemCount: tumVeriler.length,
    );
  }
}
