import 'package:meta/meta.dart';

class Todo {
  Todo({@required this.taskName, this.isAlready = false});

  final String taskName;
  bool isAlready;
}
