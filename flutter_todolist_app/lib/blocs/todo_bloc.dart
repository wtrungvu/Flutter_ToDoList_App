import 'dart:async';
import 'dart:math';
import 'package:flutter_todolist_app/bases/base_bloc.dart';
import 'package:flutter_todolist_app/bases/base_event.dart';
import 'package:flutter_todolist_app/database/todo_table.dart';
import 'package:flutter_todolist_app/events/add.dart';
import 'package:flutter_todolist_app/events/delete.dart';
import 'package:flutter_todolist_app/models/todo.dart';

class ToDoBloc extends BaseBloc {
  ToDoTable _toDoTable = ToDoTable();

  StreamController<List<Todo>> _todoListStreamController =
      StreamController<List<Todo>>();

  Stream<List<Todo>> get todoListStream =>
      _todoListStreamController.stream; // Getter

  var _randomInt = Random();
  List<Todo> _todoListData = List<Todo>();

  initData() async {
    _todoListData = await _toDoTable.selectAllTodo();
    if (_todoListData == null) {
      return;
    }

    _todoListStreamController.sink.add(_todoListData);
  }

  _addToDo(Todo todo) async {
    // insert to database
    await _toDoTable.insertToDo(todo);

    _todoListData.add(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  _deleteToDo(Todo todo) async {
    // delete to database
    await _toDoTable.deleteToDo(todo);

    _todoListData.remove(todo);
    _todoListStreamController.sink.add(_todoListData);
  }

  @override
  dispatchEvent(BaseEvent event) {
    if (event is AddToDoEvent) {
      // print(event.content);

      var random = _randomInt.nextInt(100000);
      Todo todo = Todo.fromData(
        random,
        event.content,
      );
      _addToDo(todo);
    } else if (event is DeleteToDoEvent) {
      _deleteToDo(event.todo);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}
