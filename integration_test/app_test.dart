import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todoapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('add_delete_task', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      // Clicking Fab Button & Navigate to Add Task Screen
      final Finder fab = find.byKey(const Key('addTaskFAB'));
      await tester.tap(fab);
      await tester.pumpAndSettle();

      // Adding new Task
      await tester.enterText(
          find.byKey(const Key('titleTextField')), 'Call sundar @5PM');
      await tester.enterText(
          find.byKey(const Key('descTextField')), 'Discuss about the meeting');
      final Finder addTaskButton = find.byKey(const Key('addTaskButton'));
      await tester.tap(addTaskButton);

      //going back to previous screen
      final backButton = find.byTooltip('Back');
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(find.text('Call sundar @5PM'), findsOneWidget);

      // Delete Task
      final Finder deleteButton = find.byKey(const Key('deleteButton_0'));
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();
      expect(find.text('Call sundar @5PM'), findsNothing);
    });
  });
}
