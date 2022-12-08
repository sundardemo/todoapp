import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/todo_provider.dart';
import 'package:todoapp/custom-widgets/status_card.dart';
import 'package:todoapp/model/task.dart';
import 'package:todoapp/screens/add_task.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          const StatusCard(),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: ((context, obj, child) {
                List<Task> tasks = obj.tasks;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: ((context, index) {
                    Task task = tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: Text(task.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: task.isCompleted
                                ? const Icon(Icons.check_box)
                                : const Icon(
                                    Icons.check_box_outline_blank_outlined),
                            onPressed: () {
                              tasks[index].isCompleted
                                  ? obj.markAsInComplete(index)
                                  : obj.markAsComplete(index);
                            },
                          ),
                          IconButton(
                            key: Key('deleteButton_$index'),
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              obj.deleteTask(index);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                );
              }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addTaskFAB'),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          );
        },
      ),
    );
  }
}
