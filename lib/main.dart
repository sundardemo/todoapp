import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/todo_provider.dart';
import 'package:todoapp/screens/todo_list.dart';
import 'package:todoapp/screens/webview_example.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Dem',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoListScreen(),
      ),
    );
  }
}
