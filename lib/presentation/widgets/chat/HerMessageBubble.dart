import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorLight,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        _ImageBubble(message.imageUrl ??
            "https://yesno.wtf/assets/yes/0-c44a7789d54cbdcad867fb7845ff03ae.gif"),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String url_image;

  _ImageBubble(this.url_image);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url_image,
        width: size.width * 0.7,
        height: 120,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Container(
            width: size.width * 0.7,
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text("Frida is writting"),
            // child: CircularProgressIndicator(
            //   value: loadingProgress.expectedTotalBytes != null
            //       ? loadingProgress.cumulativeBytesLoaded /
            //           loadingProgress.expectedTotalBytes!
            //       : null,
            // ),
          );
        },
      ),
    );
  }
}
