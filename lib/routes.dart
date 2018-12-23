import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/configs/app_config.dart';
import 'package:todo_list/screens/todo_list/todo_list_page.dart';

class TodoApp extends StatelessWidget {
  TodoApp(this.config);
  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    final todoListPage = TodoListPage(
      title: 'TODO',
    );

    return Platform.isIOS
        ? CupertinoApp(home: todoListPage)
        : MaterialApp(
            title: config.appName,
            theme: ThemeData(primarySwatch: Colors.blue),
            home: todoListPage);
  }
}
