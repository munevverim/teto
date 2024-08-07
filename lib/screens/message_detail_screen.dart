import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/message_controller.dart';
import '../models/message.dart';

class MessageDetailScreen extends StatelessWidget {
  final String name;

  MessageDetailScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/profile_picture.png'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              name,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.phone, color: Colors.blue),
            onPressed: () {
              // Telefon arama işlemi
            },
          ),
          IconButton(
            icon: Icon(Icons.videocam, color: Colors.blue),
            onPressed: () {
              // Video arama işlemi
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildEventInfo(),
          Expanded(child: _buildMessageList(context)),
          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildEventInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Image.asset('assets/event_image.png', height: 50, width: 50, fit: BoxFit.cover),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dans Partisi Etkinliği - 2024',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text('14 Mayıs Salı, 10:00', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    return Consumer<MessageController>(
      builder: (context, controller, child) {
        return ListView.builder(
          itemCount: controller.messages.length,
          itemBuilder: (context, index) {
            final message = controller.messages[index];
            if (message.isSentByMe) {
              return _buildSentMessage(message.content);
            } else if (message.isImage) {
              return _buildReceivedImageMessage(message.content);
            } else {
              return _buildReceivedMessage(message.content);
            }
          },
        );
      },
    );
  }

  Widget _buildReceivedMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.png'),
            radius: 20,
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(message),
          ),
        ],
      ),
    );
  }

  Widget _buildReceivedImageMessage(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.png'),
            radius: 20,
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover, width: 200),
          ),
        ],
      ),
    );
  }

  Widget _buildSentMessage(String message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_picture.png'),
            radius: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    final messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                hintText: 'Mesaj Gönder',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                Provider.of<MessageController>(context, listen: false)
                    .sendMessage(messageController.text);
                messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
