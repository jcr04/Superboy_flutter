import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  void init() {
    _speech = stt.SpeechToText();
  }

  void Function(String command)? onCommand;

  bool get isListening => _isListening;

  void start() async {
    if (!_isListening) {
      _isListening = true;
      _speech.listen(
        onResult: (result) {
          String text = result.recognizedWords;
          if (kDebugMode) {
            print(text);
          }
          if (text.contains("abrir configurações")) {
            onCommand?.call("abrirConfiguracoes");
          } else if (text.contains("voltar")) {
            onCommand?.call("voltar");
          }
        },
        listenFor: const Duration(seconds: 30),
      );
    }
  }

  void stop() {
    if (_isListening) {
      _isListening = false;
      _speech.stop();
    }
  }

  void Listen(Null Function(dynamic text) param0) {}
}
