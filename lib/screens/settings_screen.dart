import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Ayarlar',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          _buildSettingsItem(context, 'Kişisel Bilgiler', 'İsim ve profil fotoğrafını değiştir', Icons.person, '/personal_info'),
          _buildSettingsItem(context, 'Gizlilik', 'Şifre, kod ve gizlilik', Icons.lock, '/privacy'),
          _buildSettingsItem(context, 'Bildirimler', 'Bildirim ayarlarını düzenle ve değiştir', Icons.notifications, '/notifications'),
          _buildSettingsItem(context, 'Gelişmiş', 'Kişiselleştirilmiş arayüz/renkli ayarları düzenle', Icons.settings, '/advanced'),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(BuildContext context, String title, String subtitle, IconData icon, String route) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[100],
        child: Icon(icon, color: Colors.green),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
