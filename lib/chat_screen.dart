// // ignore_for_file: implementation_imports

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
// import 'chat_message.dart';
// import 'dart:async';
// import 'package:openai/openai.dart';
// import 'package:chat_gpt_sdk/src/openai.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   final List<ChatMessage> _messages = [];
//   OpenAI? chatGPT;
//   StreamSubscription? _subscription;
//   @override
//   void initState() {
//     super.initState();
//     chatGPT = OpenAI.instance;
//   }

//   @override
//   void dispose() {
//     _subscription?.cancel();

//     super.dispose();
//   }

//   void _sendMessage() {
//     ChatMessage _message =
//         ChatMessage(text: _controller.text, sender: "user"); //get a message
//     setState(() {
//       _messages.insert(0, _message);
//     });

//     _controller.clear();
//     final request = CompletionRequest(
//   prompt: _message.text,
//   model: kTranslateModelV3,
//   maxTokens: 200,
// );
//   }

//   Widget _buildTextComposer() {
//     return Row(
//       children: [
//         Expanded(
//           child: TextField(
//             controller: _controller,
//             onSubmitted: (value) => _sendMessage(),
//             decoration: InputDecoration.collapsed(hintText: 'Send a message'),
//           ),
//         ),
//         IconButton(
//           icon: const Icon(Icons.send),
//           onPressed: () => _sendMessage(),
//         )
//       ],
//     ).px16();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'ChatGPT',
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Flexible(
//                 child: ListView.builder(
//                     reverse: true,
//                     padding: Vx.m8,
//                     itemCount: _messages.length,
//                     itemBuilder: (context, index) {
//                       return _messages[index];
//                     })),
//             Container(
//               decoration: BoxDecoration(color: context.cardColor),
//               child: _buildTextComposer(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'chat_message.dart';
import 'dart:async';
// import 'package:openai/openai.dart';
import 'package:chat_gpt_sdk/src/openai.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  OpenAI? chatGPT;
  StreamSubscription? _subscription;
  @override
  void initState() {
    super.initState();
    chatGPT = OpenAI.instance;
  }

  @override
  void dispose() {
    _subscription?.cancel();

    super.dispose();
  }

  void _sendMessage() {
    ChatMessage _message =
        ChatMessage(text: _controller.text, sender: "user"); //get a message
    setState(() {
      _messages.insert(0, _message);
    });

    _controller.clear();
    final request = CompleteText(
      prompt: _message.text,
      model: Model.TextDavinci3,
      maxTokens: 200,
    );
    

  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: InputDecoration.collapsed(hintText: 'Send a message'),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => _sendMessage(),
        )
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ChatGPT',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    padding: Vx.m8,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return _messages[index];
                    })),
            Container(
              decoration: BoxDecoration(color: context.cardColor),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}

