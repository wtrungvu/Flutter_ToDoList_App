import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_todolist_app/bases/base_event.dart';

abstract class BaseBloc {
  StreamController<BaseEvent> _eventStreamController =
      StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _eventStreamController.sink; // Getter

  BaseBloc() {
    _eventStreamController.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception("Exception khong hop le");
      }
      dispatchEvent(event);
    });
  }

  dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _eventStreamController.close();
  }
}
