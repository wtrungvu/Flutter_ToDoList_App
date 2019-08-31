import 'package:flutter_todolist_app/bases/base_event.dart';
import 'package:flutter_todolist_app/models/todo.dart';

class DeleteToDoEvent extends BaseEvent {
  Todo todo;

  DeleteToDoEvent(this.todo);
}
