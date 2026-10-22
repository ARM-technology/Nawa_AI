import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:llamadart/llamadart.dart';
import 'package:http/http.dart' as http;

class LocalGemmaScreen extends StatefulWidget {
  @override
  _LocalGemmaScreenState createState() => _LocalGemmaScreenState();
}

class _LocalGemmaScreenState extends State<LocalGemmaScreen> {
  LlamaEngine? _engine;
  bool _isModelLoaded = false;
  bool _isDownloading = false;
  double _downloadProgress = 0.0;
  String _statusMessage = "النموذج غير موجود على الجهاز. اضغط للتحميل.";
  String _response = "";
  TextEditingController _controller = TextEditingController();

  // رابط التحميل المباشر لملف الـ GGUF من Hugging Face
  final String modelUrl = "https://huggingface.co/unsloth/${}/resolve/main/${}";

  @override
  void initState() {
    super.initState();
    _checkExistingModel();
  }

  // التحقق هل الملف محمل مسبقاً بجهاز الجوال أم لا
  Future<void> _checkExistingModel() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/gemma-4-E2B-it.gguf');

    if (await file.exists()) {
      setState(() {
        _statusMessage = "جاري تحميل النموذج إلى محرك التشغيل المحلي...";
      });
      await _initEngine(file.path);
    }
  }

  // دالة تحميل النموذج من الإنترنت مع شريط التقدم
  Future<void> _downloadAndSaveModel() async {
    setState(() {
      _isDownloading = true;
      _downloadProgress = 0.0;
      _statusMessage = "جاري بدء التحميل من الإنترنت...";
    });

    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/gemma-4-E2B-it.gguf';
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
            _statusMessage = "جاري التحميل: ${(_downloadProgress * 100).toStringAsFixed(1)}%";
          });
        }
        return downloadedBytes;
      });

      await sink.close();

      setState(() {
        _isDownloading = false;
        _statusMessage = "تم التحميل بنجاح! جاري تهيئة المحرك...";
      });

      await _initEngine(filePath);
    } catch (e) {
      setState(() {
        _isDownloading = false;
        _statusMessage = "حدث خطأ أثناء التحميل: $e";
      });
    }
  }

  // تهيئة محرك الـ Llama
  Future<void> _initEngine(String path) async {
    try {
      final backend = LlamaBackend();
      final modelSource = ModelSource.path(path);

      _engine = LlamaEngine(backend);
      await _engine!.setModel(LlamaModel(modelSource));

      setState(() {
        _isModelLoaded = true;
        _statusMessage = "النموذج جاهز للعمل أوفلاين بالكامل!";
      });
    } catch (e) {
      setState(() {
        _statusMessage = "خطأ في تهيئة المحرك: $e";
      });
    }
  }

  // توليد الرد من النموذج مع إجبار اللغة العربية الفصحى
  void _generateText(String prompt) async {
    if (!_isModelLoaded || _engine == null) return;

    setState(() {
      _response = "";
    });

    try {

      final fullPrompt = "أجب باللغة العربية الفصحى حصراً وبدقة:\n$prompt";

      final stream = _engine!.generate(fullPrompt);
      await for (final token in stream) {
        setState(() {
          _response += token;
        });
      }
    } catch (e) {
      setState(() {
        _response += "\nخطأ أثناء التوليد: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gemma Local AI (Offline)")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_statusMessage, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 10),
            if (_isDownloading) ...[
              LinearProgressIndicator(value: _downloadProgress),
              SizedBox(height: 10),
              Text("${(_downloadProgress * 100).toStringAsFixed(1)}%"),
            ],
            if (!_isModelLoaded && !_isDownloading)
              ElevatedButton(
                onPressed: _downloadAndSaveModel,
                child: Text("تحميل النموذج الآن (من الإنترنت)"),
              ),
            SizedBox(height: 20),
            if (_isModelLoaded) ...[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "اكتب سؤالك (عربي أو إنجليزي)...",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _generateText(_controller.text),
                child: Text("إرسال للنموذج المحلي"),
              ),
            ],
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_response, style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}