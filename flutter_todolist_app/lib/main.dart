import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/database/todo_db.dart';
import 'package:provider/provider.dart';

import 'blocs/todo_bloc.dart';
import 'views/home.dart';

void main() async {
  await TodoDatabase.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("To Do List"),
        ),
        body: Provider<ToDoBloc>.value(
          value: ToDoBloc(),
          child: Home(),
        ),
      ),
    );
  }
}
