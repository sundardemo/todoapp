import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_provider.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                const Text("Total"),
                const SizedBox(height: 8),
                Text(
                  Provider.of<TodoProvider>(context).getTaskCount.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text("Completed"),
                const SizedBox(height: 8),
                Text(
                  Provider.of<TodoProvider>(context)
                      .getCompletedTaskCount()
                      .toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
