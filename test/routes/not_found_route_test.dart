import 'package:chai_interactions/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotFoundRoute', () {
    testWidgets('should display "Not Found" text', (tester) async {
      final route = NotFoundRoute();

      await tester.pumpWidget(
        MaterialApp(
          builder: (context, _) => route.buildContent(context),
        ),
      );

      expect(find.text('Not Found'), findsOneWidget);
    });

    test('should be a MaterialPageRoute', () {
      final route = NotFoundRoute();
      expect(route, isA<MaterialPageRoute<void>>());
    });
  });
}
