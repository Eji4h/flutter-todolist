import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/screens/todo_list/todo_card.dart';
import 'package:todo_list/screens/todo_add/todo_add_page.dart';

class TodoListPage extends StatefulWidget {
  final String title;

  TodoListPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TodoListPage();
}

class _TodoListPage extends State<TodoListPage> {
  final todos = List<Todo>();

  void _toTodoAddPage(Todo todo) {
    final builder = (context) => TodoAddPage(
          todos: todos,
        );

    Navigator.push(
        context,
        Platform.isIOS
            ? CupertinoPageRoute(builder: builder)
            : MaterialPageRoute(builder: builder));
  }

  @override
  Widget build(BuildContext context) {
    var child = Container(
        child: ListView.builder(
      itemCount: todos.length,
      itemBuilder: (buildContext, position) {
        return GestureDetector(
          child: TodoCard(todo: todos[position]),
        );
      },
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: child,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTodo = Todo(taskName: 'Task name');
          todos.add(newTodo);
          _toTodoAddPage(newTodo);
        },
        tooltip: 'Add task',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();

    todos.add(Todo(taskName: 'Buy milk'));
    todos.add(Todo(taskName: 'Go to gym'));
    todos.add(Todo(taskName: 'Haircut'));
    todos.add(Todo(taskName: 'Write Flutter plugin'));
    todos.add(Todo(taskName: 'Read book', isAlready: true));
    todos.add(Todo(taskName: 'Book flight to Singapore', isAlready: true));
    todos.add(Todo(taskName: 'Prepare Flutter slides', isAlready: true));
  }
}
