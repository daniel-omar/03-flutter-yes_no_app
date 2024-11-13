import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message("Hola", fromWho: FromWho.mine),
    Message("Hola muak", fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text, fromWho: FromWho.mine);
    messages.add(newMessage);

    if (text.endsWith("?")) {
      herReply();
      print("GG");
    }

    //similar al setState()
    notifyListeners();
    // SOLUCIÓN: AÑADIR ESTAS LÍNEAS DE CÓDIGO
    SchedulerBinding.instance.addPostFrameCallback((_) {
      moveScrollToBottom();
    });
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);

    notifyListeners();
    // SOLUCIÓN: AÑADIR ESTAS LÍNEAS DE CÓDIGO
    SchedulerBinding.instance.addPostFrameCallback((_) {
      moveScrollToBottom();
    });
  }
}
