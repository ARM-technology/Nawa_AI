import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:llamadart/llamadart.dart';
import 'package:nowachat/Model_ai/ModelEngine.dart';
import 'package:nowachat/View/Managment/PromptEngineering.dart';


class ChatScreen extends ConsumerStatefulWidget {
  final LlamaEngine engine;
  const ChatScreen({Key? key, required this.engine}) : super(key: key);

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _input = TextEditingController();

  final List<Map<String, String>> _messages = [];
  bool _isGenerating = false;

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }


  Future<void> _sendMessage() async {
    final text = _input.text.trim();
    if (text.isEmpty || _isGenerating) return;

    _input.clear();

    setState(() {
      _messages.add({"role": "user", "text": text});
      _messages.add({"role": "assistant", "text": "..."});
      _isGenerating = true;
    });

    try {
      final fullPrompt = "<|im_start|>system\n${ref.watch(promptEngineering)}.<|im_end|>\n<|im_start|>user\n$text<|im_end|>\n<|im_start|>assistant\n";

      final stream = widget.engine.generate(fullPrompt);

      String aiResponse = "";
      await for (final token in stream) {
        aiResponse += token;
        setState(() {
          _messages.last["text"] = aiResponse;
        });
      }
    } catch (e) {
      setState(() {
        _messages.last["text"] = "Error Genertion : $e";
      });
    } finally {
      setState(() {
        _isGenerating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nawa Chat AI") ,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx)=>Promptengineering()),
          );
          },
        ),
      ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isUser = msg["role"] == "user";
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(msg["text"] ?? ""),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              textDirection: TextDirection.ltr,
              children: [
                Expanded(
                  child: TextField(
                    controller: _input,
                    decoration: InputDecoration(
                      labelText: "Write Message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: _isGenerating
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.send),
                  onPressed: _isGenerating ? null : _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}