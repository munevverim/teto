import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Bildirimler',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            _buildTabBar(),
            SizedBox(height: 20),
            _buildNotificationList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildTab('Tümü', 0),
        _buildTab('Okunmamış', 1),
        _buildTab('Eski', 2),
      ],
    );
  }

  Widget _buildTab(String text, int index) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Column(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 3,
              width: 50,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  Widget _buildNotificationList() {
    List<Widget> notifications = [];
    if (_selectedTabIndex == 0) {
      notifications = _buildAllNotifications();
    } else if (_selectedTabIndex == 1) {
      notifications = _buildUnreadNotifications();
    } else {
      notifications = _buildOldNotifications();
    }

    if (notifications.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 50,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Henüz Bildirim Yok',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tüm bildirim ve yaklaşan etkinlikler\nburada görüntülenecektir',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      );
    } else {
      return Expanded(
        child: ListView(
          children: notifications,
        ),
      );
    }
  }

  List<Widget> _buildAllNotifications() {
    return [
      _buildNotificationItem('Yaklaşan Etkinlik', 'Etkinlik Başlığı burada yazar', '8 Mayıs 2024, 14:00', true),
      _buildNotificationItem('Yaklaşan Etkinlik', 'Etkinlik Başlığı burada yazar', '8 Mayıs 2022, 14:00', false),
    ];
  }

  List<Widget> _buildUnreadNotifications() {
    return [
      _buildNotificationItem('Yaklaşan Etkinlik', 'Etkinlik Başlığı burada yazar', '8 Mayıs 2024, 14:00', true),
    ];
  }

  List<Widget> _buildOldNotifications() {
    return [
      _buildNotificationItem('Yaklaşan Etkinlik', 'Etkinlik Başlığı burada yazar', '8 Mayıs 2022, 14:00', false),
    ];
  }

  Widget _buildNotificationItem(String title, String subtitle, String date, bool isNew) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/event_image.png'),
        radius: 30,
      ),
      title: Text(title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(subtitle),
          SizedBox(height: 5),
          Text(date, style: TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: isNew ? Icon(Icons.fiber_new, color: Colors.green) : null,
    );
  }
}
