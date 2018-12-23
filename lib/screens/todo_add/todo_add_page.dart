import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

class TodoAddPage extends StatefulWidget {
  final List<Todo> todos;

  TodoAddPage({@required this.todos});

  @override
  State<StatefulWidget> createState() => _TodoAddPageState(todos: todos);
}

class _TodoAddPageState extends State<TodoAddPage> {
  final List<Todo> todos;

  _TodoAddPageState({@required this.todos});

  @override
  Widget build(BuildContext context) {
    var page = Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Enter todo here...'),
              style: TextStyle(fontSize: 24.0, color: Colors.black),
              onSubmitted: (text) {
                todos.add(Todo(taskName: text));
                Navigator.pop(context);
              },
            ),
          )
        ]));

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(),
            child: SafeArea(child: page))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
            ),
            body: page,
          );
  }
}
