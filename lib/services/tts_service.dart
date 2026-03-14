import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  final FlutterTts flutterTts = FlutterTts();

  Future speak(String text) async {
    await flutterTts.speak(text);
  }

  Future stop() async {
    await flutterTts.stop();
  }
}
