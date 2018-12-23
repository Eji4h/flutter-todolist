import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list/models/todo.dart';

class TodoCard extends StatefulWidget {
  final Todo todo;

  TodoCard({@required this.todo});

  @override
  State<StatefulWidget> createState() => _TodoCardState(todo: todo);
}

class _TodoCardState extends State<TodoCard> {
  final Todo todo;
  _TodoCardState({@required this.todo});

  @override
  Widget build(BuildContext context) {
    final title = Text(
      todo.taskName,
      style: todo.isAlready
          ? TextStyle(decoration: TextDecoration.lineThrough)
          : TextStyle(),
    );

    return CheckboxListTile(
      title: title,
      value: todo.isAlready,
      onChanged: (bool value) {
        setState(() {
          todo.isAlready = value;
        });
      },
    );
  }
}
