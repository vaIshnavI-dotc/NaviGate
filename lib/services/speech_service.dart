import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();

  bool isListening = false;

  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  void startListening(Function(String) onResult) {
    _speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
    isListening = true;
  }

  void stopListening() {
    _speech.stop();
    isListening = false;
  }
}
