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
