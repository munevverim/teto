import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;

  CustomCard({required this.title, required this.date, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              date,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 5),
            Text(
              location,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
