import 'package:flutter/material.dart';

class TermsPrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> selectedInterests = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kullanım ve Gizlilik Sözleşmesi',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Vivibe privacy, policies and terms of service',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Afropolitan\'s mission is to make.. One super community forum for the Digital nation',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                '• Information we collect from you',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Donec nec dapibus magnis adipiscing viverra morbi ullamcorper. Aliquet feugiat interdum porttitor non. assa in integer ut id ornare. Vestibulum id viverra pellentesque nam. Egestas at ipsum justo ipsum pellentesque sit ac adipiscing massa. Aliquet donec diam lacus mi tempor tincidunt donec porta consectetur etiam.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                '• Information we collect from you',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet consectetur. Donec nec dapibus magnis adipiscing viverra morbi ullamcorper. Aliquet feugiat interdum porttitor non. assa in integer ut id ornare. Vestibulum id viverra pellentesque nam. Egestas at ipsum justo ipsum pellentesque sit ac adipiscing massa. Aliquet donec diam lacus mi tempor tincidunt donec porta consectetur etiam.',
                style: TextStyle(fontSize: 14),
              ),
              // Daha fazla içerik ekleyebilirsiniz
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/final',
                    arguments: selectedInterests,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff0072FF),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('KABUL EDİYORUM'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
