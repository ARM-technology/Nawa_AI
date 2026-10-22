import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:llamadart/llamadart.dart';
import 'package:path_provider/path_provider.dart';

import 'Model_ai/ModelEngine.dart';
import 'View/Chat/Chat_Screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'NawaChat',
        home: AppChat(),
      ),
    ),
  );
}

class AppChat extends ConsumerStatefulWidget {
  const AppChat({Key? key}) : super(key: key);

  @override
  ConsumerState<AppChat> createState() => _AppChatState();
}

class _AppChatState extends ConsumerState<AppChat> {
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  String _statusMessage = "Model not found on device. Tap to download.";

  final String modelUrl = "https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF/resolve/main/qwen2.5-0.5b-instruct-q4_k_m.gguf";

  final String fileName = "qwen2.5-0.5b-instruct-q4_k_m.gguf";

  @override
  void initState() {
    super.initState();
    _checkAndLoadModel();
  }

  Future<String> _getModelPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$fileName';
  }

  Future<void> _checkAndLoadModel() async {
    final filePath = await _getModelPath();
    final file = File(filePath);

    if (await file.exists()) {
      setState(() {
        _statusMessage = "Model found, initializing engine...";
      });

      ref.invalidate(llamaEngineProvider);
    }
  }

  Future<void> _downloadAndSaveModel() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
      _statusMessage = "Starting download from internet...";
    });

    try {
      final filePath = await _getModelPath();
      final file = File(filePath);

      final request = http.Request('GET', Uri.parse(modelUrl));
      final response = await http.Client().send(request);

      final contentLength = response.contentLength ?? 0;
      int downloadedBytes = 0;

      final sink = file.openWrite();
      await response.stream.fold<int>(0, (previous, chunk) {
        sink.add(chunk);
        downloadedBytes += chunk.length;
        if (contentLength > 0) {
          setState(() {
            _downloadProgress = downloadedBytes / contentLength;
            _statusMessage =
            "Downloading: ${(_downloadProgress * 100).toStringAsFixed(1)}%";
          });
        }
        return downloadedBytes;
      });

      await sink.close();

      setState(() {
        _isDownloading = false;
        _statusMessage = "Download complete! Initializing engine...";
      });

      ref.invalidate(llamaEngineProvider);

    } catch (e) {
      setState(() {
        _isDownloading = false;
        _statusMessage = "Error during download: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final engineAsync = ref.watch(llamaEngineProvider);

    ref.listen<AsyncValue<LlamaEngine>>(llamaEngineProvider, (previous, next) {
      next.whenData((engine) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ChatScreen(engine: engine),
            ),
          );
        }
      });
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome to Nawa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: engineAsync.when(
            loading: () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  _isDownloading ? _statusMessage : "Initializing engine in memory...",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                if (_isDownloading) ...[
                  const SizedBox(height: 10),
                  LinearProgressIndicator(value: _downloadProgress),
                  const SizedBox(height: 10),
                  Text("${(_downloadProgress * 100).toStringAsFixed(1)}%"),
                ],
              ],
            ),
            error: (error, stackTrace) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _statusMessage,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (!_isDownloading)
                  ElevatedButton.icon(
                    onPressed: _downloadAndSaveModel,
                    icon: const Icon(Icons.download),
                    label: const Text("Download Model Now"),
                  ),
              ],
            ),
            data: (engine) {
              return const Text("Model ready! Navigating...");
            },
          ),
        ),
      ),
    );
  }
}