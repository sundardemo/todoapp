import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todoapp/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('End to end testing', () {
    testWidgets('Add, Delete task', (tester) async {
      app.main();

      await tester.pumpAndSettle();

      var fab = find.byKey(const Key('addTaskFAB'));
      await tester.tap(fab);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(const Key('titleTextField')), 'Take a bath');
      await tester.enterText(
          find.byKey(const Key('descTextField')), 'Take a bath at 5 am');

      var addTaskButton = find.byKey(const Key('addTaskButton'));
      await tester.tap(addTaskButton);

      var backButton = find.byTooltip('Back');
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      expect(find.text('Take a bath'), findsOneWidget);

      var deleteButton = find.byKey(const Key('deleteButton_0'));
      await tester.tap(deleteButton);
      await tester.pumpAndSettle();
      expect(find.text('Take a bath'), findsNothing);
    });
  });
}
