import 'package:flutter_todolist_app/database/todo_table.dart';
import 'package:flutter_todolist_app/models/todo.dart';
import 'package:flutter_todolist_app/services/todo_service.dart';

class TodoRepo {
  ToDoTable _todoTable = ToDoTable();
  TodoService todoService = TodoService();

  Future<int> insertTodo(Todo todo) {
    return _todoTable.insertToDo(todo);
  }

  Future<void> deleteTodo(Todo todo) async {
    return _todoTable.deleteToDo(todo);
  }

  Future<List<Todo>> selectAllTodo() async {
    return _todoTable.selectAllTodo();
  }

  Future<List<Todo>> initData() async {
    List<Todo> data = List<Todo>();
    data = await _todoTable.selectAllTodo();
    if (data.length == 0) {
      return await todoService.getTodoList();
    }
    return data;
  }
}
