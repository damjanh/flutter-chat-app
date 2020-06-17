import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String username;
  final String message;
  final bool isMe;
  final Key key;
  final String userImage;

  MessageBubble(
    this.username,
    this.message,
    this.userImage,
    this.isMe, {
    this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: isMe
                        ? Colors.grey[300]
                        : Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(!isMe ? 0 : 12),
                      bottomRight: Radius.circular(isMe ? 0 : 12),
                    ),
                  ),
                  width: 140,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 16,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isMe
                              ? Colors.black
                              : Theme.of(context)
                                  .accentTextTheme
                                  .headline1
                                  .color,
                        ),
                        textAlign: isMe ? TextAlign.end : TextAlign.start,
                      ),
                      Text(
                        message,
                        style: TextStyle(
                          color: isMe
                              ? Colors.black
                              : Theme.of(context)
                                  .accentTextTheme
                                  .headline1
                                  .color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 120,
          right: isMe ? 120: null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
    );
  }
}
