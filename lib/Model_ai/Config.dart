import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:llamadart/llamadart.dart';
import 'package:path_provider/path_provider.dart';



final model = StateProvider<String?>((ref) => "Qwen/Qwen2.5-0.5B-Instruct-GGUF");


