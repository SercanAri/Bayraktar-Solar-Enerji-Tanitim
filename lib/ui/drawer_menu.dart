import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Sercan ARI'),
            accountEmail: Text('sercanari1904@gmail.com'),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage:
                  NetworkImage('https://i.hizliresim.com/mju6gdi.png'),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text('SA'),
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Text('BS'),
              )
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Ana Sayfa'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.call),
                  title: Text('Ara'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Profil'),
                  trailing: Icon(Icons.chevron_right),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    debugPrint('');
                  },
                  splashColor: Colors.cyan,
                  child: const ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Ana Sayfa'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const AboutListTile(
                  applicationName: 'Bayraktar Solar Enerji',
                  applicationIcon: Icon(Icons.save),
                  applicationVersion: '1.0',
                  child: Text('ABOUT US'),
                  applicationLegalese: '',
                  icon: Icon(Icons.keyboard),
                  aboutBoxChildren: <Widget>[
                    Text('Child 1'),
                    Text('Child 2'),
                    Text('Child 3'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
