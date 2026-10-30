# 🚀 NawaChat - On-Device Local LLM for Mobile

**NowaChat** is a lightweight, high-performance Flutter mobile application designed to run Large Language Models (LLMs) completely **offline and locally** on mobile devices (iOS & Android).

By leveraging **Riverpod**, **llamadart**, and the **Qwen2.5-0.5B-Instruct-GGUF** model, NowaChat delivers fast, private, and energy-efficient AI responses without needing an internet connection or external servers.

---

## ✨ Features

- 🔒 **100% Offline & Private:** All data processing and text generation happen locally on your phone.
- ⚡ **Battery & Memory Efficient:** Optimized for minimal thermal throttle and battery consumption using `Qwen2.5-0.5B-Instruct` (Q4_K_M quantization).
- 🌐 **Bilingual Support:** High proficiency in understanding and generating both Arabic and English.
- 🏗️ **Clean Architecture:** Built with `flutter_riverpod` for robust state management and seamless UI transitions.
- 📥 **Auto Model Downloader:** Automatically checks for local model files, manages progress during downloads from Hugging Face, and initializes the engine.
- Support LLM Studio
---

## 🛠️ Tech Stack & Dependencies

- **Framework:** [Flutter](https://flutter.dev/)
- **State Management:** [Flutter Riverpod](https://riverpod.dev/)
- **Local Engine:** [llamadart](https://pub.dev/packages/llamadart) (LLaMA C++ bindings)
- **Model:** [Qwen2.5-0.5B-Instruct-GGUF](https://huggingface.co/Qwen/Qwen2.5-0.5B-Instruct-GGUF)
- **File Management:** `path_provider` & `http`

---

## 📱 Hardware Requirements

Designed and tested to run smoothly on modern mobile processors:

- **iOS:** iPhone 15 series or newer (iOS 14.0+)
- **Android:** Samsung Galaxy S23 series or newer (Android 8.0+)
  *Note: Older devices can run the app, but response generation speed may vary.*

---

## 🚀 Getting Started

### Prerequisites
Make sure you have Flutter installed on your machine.
- [Flutter SDK Installation Guide](https://docs.flutter.dev/get-started/install)

### Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/YOUR_USERNAME/NowaChat.git](https://github.com/YOUR_USERNAME/NowaChat.git)
   cd NawaChat
