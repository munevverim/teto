import 'package:flutter/material.dart';
import 'event_preview_screen.dart'; // EventPreviewScreen'i içe aktarın
import 'profile_screen.dart'; // ProfileScreen'i içe aktarın

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tetto',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.grey),
            onPressed: () {
              // Bildirim butonu
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Etkinlik Ara',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('Kültür & Sanat', isSelected: true),
                    _buildCategoryChip('Müzik'),
                    _buildCategoryChip('Party / Gece Hayatı'),
                    // Diğer kategoriler
                  ],
                ),
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Popüler Etkinlikler'),
              _buildEventCard(),
              SizedBox(height: 16),
              _buildSectionTitle('Yeni Etkinlikler'),
              Row(
                children: [
                  Expanded(child: _buildEventCard()),
                  SizedBox(width: 8),
                  Expanded(child: _buildEventCard()),
                ],
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Ücretsiz Etkinlikler'),
              Row(
                children: [
                  Expanded(child: _buildEventCard()),
                  SizedBox(width: 8),
                  Expanded(child: _buildEventCard()),
                ],
              ),
              SizedBox(height: 16),
              _buildSectionTitle('Yakındaki Etkinlikler'),
              _buildEventCard(),
              _buildEventCard(),
              _buildEventCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Etkinlikler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 1) { // Etkinlikler butonu
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventPreviewScreen()),
            );
          } else if (index == 2) { // Profil butonu
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? Colors.yellow[700] : Colors.grey[200],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEventCard() {
    return Card(
      child: Column(
        children: [
          Image.network(
            'https://via.placeholder.com/150',
            height: 100,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Etkinlik Başlığı',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'Etkinlik açıklaması burada yer alacak.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 4),
                Text(
                  'Fiyat: Ücretsiz',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
