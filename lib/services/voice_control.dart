import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceControl {
  final stt.SpeechToText _speechToText = stt.SpeechToText();
  bool _isListening = false;

  Future<bool> startListening() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print('onStatus: $status'),
        onError: (error) => print('onError: $error'),
      );
      if (available) {
        _isListening = true;
        _speechToText.listen(
          onResult: (result) => print('onResult: $result'),
          listenFor: const Duration(seconds: 10),
          pauseFor: const Duration(seconds: 5),
          partialResults: true,
        );
        return true;
      }
    }
    return false;
  }

  void stopListening() {
    if (_isListening) {
      _isListening = false;
      _speechToText.stop();
    }
  }
}
