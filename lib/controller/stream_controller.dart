import 'dart:async';

class MyStreamController {
  final textChange = StreamController<String>.broadcast();

  get stream => textChange.stream;

  get chnage => textChange.sink.add;

  void dispose() {
    textChange.close();
  }
}

MyStreamController textController = MyStreamController();
