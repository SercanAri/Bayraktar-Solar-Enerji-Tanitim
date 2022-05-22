import 'package:flutter/material.dart';
import 'package:flutter_dersleri_bolum2/ui/ana_sayfa.dart';
import 'package:flutter_dersleri_bolum2/ui/linechart.dart';
import 'package:flutter_dersleri_bolum2/ui/drawer_menu.dart';
import 'package:flutter_dersleri_bolum2/ui/piechart.dart';

void main() => runApp(const FlutterDersleri());

class FlutterDersleri extends StatelessWidget {
  const FlutterDersleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      fontFamily: 'Genel',
      primarySwatch: Colors.orange,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bayraktar',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.orangeAccent),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  late List<Widget> tumSayfalar;
  late AnaSayfa sayfaAna;
  late LinePage sayfaArama;
  late PieChart pageViewOrnek;

  var keyAnaSayfa = const PageStorageKey('key_ana_sayfa');
  var keyArama = const PageStorageKey('key_arama_sayfa');

  @override
  void initState() {
    super.initState();
    sayfaAna = AnaSayfa(keyAnaSayfa);
    sayfaArama = LinePage(
      k: keyArama,
    );
    pageViewOrnek = const PieChart();
    tumSayfalar = [sayfaAna, sayfaArama, pageViewOrnek];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        title: const Text(
          'BAYRAKTAR SOLAR ENERJI',
          style: TextStyle(
              fontStyle: FontStyle.normal, wordSpacing: 5, fontSize: 21),
        ),
      ),
      body: secilenMenuItem <= tumSayfalar.length - 1
          ? tumSayfalar[secilenMenuItem]
          : tumSayfalar[0],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(
          canvasColor: Colors.cyan.shade100,
          primaryColor: Color.fromARGB(255, 139, 83, 8)),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ana Sayfa',
              backgroundColor: Color.fromARGB(255, 61, 115, 241)),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_line_chart),
              label: 'Line Chart',
              backgroundColor: Color.fromARGB(255, 190, 63, 124)),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Pie Chart',
              backgroundColor: Color.fromARGB(255, 163, 70, 179)),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenMenuItem,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
            if (index == 3) {}
          });
        },
      ),
    );
  }
}
