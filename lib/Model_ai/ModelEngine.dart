import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:llamadart/llamadart.dart';
import 'package:path_provider/path_provider.dart';



final promptEngineering = StateProvider<String?>((ref) => "Your techer english name NowaChat AI");


final modelPathProvider = FutureProvider<String>((ref) async {
  final directory = await getApplicationDocumentsDirectory();
  return '${directory.path}/qwen2.5-0.5b-instruct-q4_k_m.gguf';
});

final llamaEngineProvider = FutureProvider.autoDispose<LlamaEngine>((ref) async {
  final path = await ref.watch(modelPathProvider.future);

  final file = File(path);
  if (!await file.exists()) {
    throw Exception("Model Not here have to download model...");
  }

  final backend = LlamaBackend();
  final modelSource = ModelSource.path(path);

  final engine = LlamaEngine(backend);
  await engine.setModel(LlamaModel(modelSource));

  ref.onDispose(() {
  });

  return engine;
});