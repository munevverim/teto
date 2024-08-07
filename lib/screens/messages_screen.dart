import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_detail_screen.dart';
import '../controllers/message_controller.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Mesajlarım',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Consumer<MessageController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemCount: controller.messages.length,
            itemBuilder: (context, index) {
              final message = controller.messages[index];
              return _buildMessageItem(
                context,
                message.sender,
                message.content,
                message.timestamp.toString(),
                !message.isSentByMe,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, String name, String message, String time, bool isNew) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/profile_picture.png'),
        radius: 30,
      ),
      title: Text(name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(message),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(time, style: TextStyle(color: Colors.grey)),
          if (isNew)
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.blue,
              child: Text('1', style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessageDetailScreen(name: name)),
        );
      },
    );
  }
}
