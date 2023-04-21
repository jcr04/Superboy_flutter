import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeechRecognitionService {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  void init() {
    _speech = stt.SpeechToText();
  }

  bool get isListening => _isListening;

  void start() async {
    if (!_isListening) {
      _isListening = true;
      _speech.listen(
        onResult: (result) {
          // O texto reconhecido é retornado no parâmetro result
          String text = result.recognizedWords;
          print(text);
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
