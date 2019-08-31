import 'package:flutter/material.dart';
import 'package:flutter_todolist_app/blocs/todo_bloc.dart';
import 'package:flutter_todolist_app/events/add.dart';
import 'package:flutter_todolist_app/events/delete.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var txtToDoSomething = TextEditingController();
    var bloc = Provider.of<ToDoBloc>(context);

    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            controller: txtToDoSomething,
            decoration: InputDecoration(
              labelText: "To do",
              hintText: "Something...",
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        RaisedButton(
          child: Text("Add+"),
          onPressed: () {
            bloc.event.add(
              AddToDoEvent(txtToDoSomething.text),
            );
          },
        ),
      ],
    );
  }
}
