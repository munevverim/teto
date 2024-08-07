import 'package:flutter/material.dart';

class InterestSelectionScreen extends StatefulWidget {
  @override
  _InterestSelectionScreenState createState() => _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  final List<String> interests = [
    'Müzik', 'Yoga', 'Yemek', 'Spor', 'Doğa', 'Parti',
    'Kültür', 'Gezi', 'Eğlence', 'Oyun', 'Koşu', 'Sahil',
    'Fotoğrafçılık', 'Shopping'
  ];

  final List<bool> selectedInterests = List.generate(14, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'İlgi Alanlarınız Nelerdir, Murat?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Sizin için en iyi öneri ve deneyim için ilgi alanlarınızı seçiniz. Birden fazla seçebilirsiniz.'),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: interests.length,
                itemBuilder: (context, index) {
                  return FilterChip(
                    label: Text(interests[index]),
                    selected: selectedInterests[index],
                    onSelected: (bool selected) {
                      setState(() {
                        selectedInterests[index] = selected;
                      });
                    },
                    selectedColor: Colors.blue.shade100,
                    backgroundColor: Colors.white,
                    checkmarkColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: selectedInterests[index] ? Colors.blue : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Seçilen ilgi alanları ile yapılacak işlemler
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'CONTINUE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
