import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/providers/sqlite_demo.dart';
import 'package:todoapp/providers/todo_provider.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);
  final TextEditingController _titleCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              key: const Key('titleTextField'),
              controller: _titleCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              key: const Key('descTextField'),
              controller: _descCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              key: const Key('addTaskButton'),
              onPressed: () {
                // Provider.of<TodoProvider>(
                //   context,
                //   listen: false,
                // ).addTask(_titleCtrl.text, _descCtrl.text);
                SQLiteHelper().insertData(
                    Task(title: _titleCtrl.text, description: _descCtrl.text));
              },
              child: const Text('Add Task'),
            )
          ],
        ),
      ),
    );
  }
}
