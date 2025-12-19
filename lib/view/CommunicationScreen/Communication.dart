import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Custom_Widgets/TextFormfield.dart';
import '../../provider/provider.dart';





class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RootProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

        Expanded(
        child: ListView.builder(
        reverse: true,
          itemCount: provider.messages.length,
          itemBuilder: (context, index) {
            final message = provider.messages[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Align(
                alignment:
                message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: message.isUser ? Colors.green[300] : Colors.grey[300],
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: message.isUser
                          ? const Radius.circular(12)
                          : const Radius.circular(0),
                      bottomRight: message.isUser
                          ? const Radius.circular(0)
                          : const Radius.circular(12),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    message.text,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            );
          },
        ),
      ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: msg,
                      Hint: "Ask me anything...",
                      Colorz: Colors.white,
                      clr: Colors.grey[200]!,
                      fclr: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if(msg.text.trim().isEmpty)return;
                      context.read<RootProvider>().gpt(
                        context,
                        msg.text.trim(),
                      );
                      msg.clear();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
