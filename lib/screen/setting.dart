import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Bahasa'),
              trailing: Icon(Icons.language), 
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Tema'),
              trailing: Icon(Icons.color_lens), 
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Akun Terhubung'),
              trailing: Icon(Icons.link), 
              onTap: () {
              },
            ),
            ListTile(
              title: Text('Tentang Aplikasi'),
              trailing: Icon(Icons.info), 
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
