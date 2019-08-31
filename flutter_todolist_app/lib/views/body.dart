import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/blocs/todo_bloc.dart';
import 'package:flutter_todolist_app/events/delete.dart';
import 'package:flutter_todolist_app/models/todo.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ToDoBloc>(
      builder: (context, bloc, child) => StreamBuilder<List<Todo>>(
        stream: bloc.todoListStream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      snapshot.data[index].content,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    trailing: GestureDetector(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onTap: () {
                        bloc.event.add(
                          DeleteToDoEvent(snapshot.data[index]),
                        );
                      },
                    ),
                  );
                },
              );
            case ConnectionState.none:
              return Center(
                child: Text(
                  "Not connected to the Stream or null",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              );
            case ConnectionState.waiting:
              return Center(
                child: Text(
                  "Emty",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              );
            default:
              return Center(
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 7.0,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
