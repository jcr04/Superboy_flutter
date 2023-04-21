// services/voice_control_service.dart

import 'package:speech_to_text/speech_to_text.dart';

class VoiceControlService {
  final SpeechToText speech = SpeechToText();

  Future<bool> init() async {
    final bool available = await speech.initialize(
      onError: (error) => print('Error: $error'),
    );
    return available;
  }
}
