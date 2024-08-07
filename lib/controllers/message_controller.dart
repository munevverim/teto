import 'package:flutter/foundation.dart';

class Message {
  final String sender;
  final String content;
  final DateTime timestamp;
  final bool isSentByMe;
  final bool isImage;

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
    required this.isSentByMe,
    this.isImage = false,
  });
}

class MessageController with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void sendMessage(String content, {bool isImage = false}) {
    final message = Message(
      sender: 'Me',
      content: content,
      timestamp: DateTime.now(),
      isSentByMe: true,
      isImage: isImage,
    );
    _messages.add(message);
    notifyListeners();
  }

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}

