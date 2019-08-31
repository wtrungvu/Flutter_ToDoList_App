import 'package:flutter_todolist_app/bases/base_event.dart';

class AddToDoEvent extends BaseEvent {
  String content;

  AddToDoEvent(this.content);
}
