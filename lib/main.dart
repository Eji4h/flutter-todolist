import 'package:flutter/material.dart';
import 'configs/app_config.dart';
import 'routes.dart';

void main() {
  var configuredApp =
      AppConfig(flavorName: 'development', appName: 'Email Mockup');
  runApp(TodoApp(configuredApp));
}
