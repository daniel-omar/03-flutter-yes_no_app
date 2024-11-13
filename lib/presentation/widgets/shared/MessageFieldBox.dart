import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  late FocusNode focusNode;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(15),
    );

    final inputDecoration = InputDecoration(
      hintText: "End your message with a??",
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          final String textValue = textController.value.text;
          textController.clear();
          widget.onValue(textValue);
        },
        icon: const Icon(Icons.send_outlined),
      ),
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();

        widget.onValue(value);
      },
      // onChanged: (value) {
      //   print('Changed value $value');
      // },
    );
  }
}
