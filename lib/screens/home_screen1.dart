import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> selectedInterests = [];

  void toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  Widget buildInterestButton(String label) {
    bool isSelected = selectedInterests.contains(label);
    return GestureDetector(
      onTap: () => toggleInterest(label),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.blue,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle,
              color: isSelected ? Colors.white : Colors.blue,
            ),
            SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Geri butonuna basıldığında yapılacak işlem
              },
            ),
            SizedBox(height: 16),
            Text(
              'İlgi Alanlarınız Nelerdir, Murat?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Sizin için en iyi öneri ve deneyim için ilgi alanlarınızı seçiniz. Birden fazla seçebilirsiniz.',
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 3 / 1.5,
                children: [
                  buildInterestButton('Müzik'),
                  buildInterestButton('Yemek'),
                  buildInterestButton('Doğa'),
                  buildInterestButton('Kültür'),
                  buildInterestButton('Eğlence'),
                  buildInterestButton('Koşu'),
                  buildInterestButton('Fotoğrafçılık'),
                  buildInterestButton('Yoga'),
                  buildInterestButton('Spor'),
                  buildInterestButton('Parti'),
                  buildInterestButton('Gezi'),
                  buildInterestButton('Oyun'),
                  buildInterestButton('Sahil'),
                  buildInterestButton('Shopping'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/profile-photo',
                    arguments: selectedInterests,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0072FF),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('CONTINUE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
