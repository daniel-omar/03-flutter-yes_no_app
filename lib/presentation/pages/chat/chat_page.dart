import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/main.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/HerMessageBubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/MyMessageBubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/MessageFieldBox.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://pbs.twimg.com/card_img/1854299546349711361/C6nyrmPE?format=jpg&name=4096x4096"),
          ),
        ),
        title: const Text("bar"),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return (message.fromWho == FromWho.hers)
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  },
                ),
              ),

              /// Caja de texto de mensajes
              MessageFieldBox(
                onValue: (value) => chatProvider.sendMessage(value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
