import 'package:flutter_test/flutter_test.dart';
import 'package:todoapp/providers/todo_provider.dart';

void main() {
  late TodoProvider todoProvider;
  setUp(() {
    todoProvider = TodoProvider();
  });
  group('Todo Check List', () {
    test('Add New Task', () {
      todoProvider.addTask('Hello', 'World');
      expect(todoProvider.getTaskCount, 1);
    });

    test('Delete Task', () {
      todoProvider.addTask('Hello', 'World');
      todoProvider.deleteTask(0);
      expect(todoProvider.getTaskCount, 0);
    });
  });
}
