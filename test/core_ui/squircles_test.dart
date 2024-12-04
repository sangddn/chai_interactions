import 'package:chai_interactions/core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SquircleStadiumBorder', () {
    test('copyWith returns new instance with specified properties', () {
      const border = SquircleStadiumBorder(
        side: BorderSide(width: 2.0, color: Colors.red),
      );

      final copied = border.scale(2.0) as SquircleStadiumBorder;

      expect(copied.side.width, 4.0);
      expect(copied.side.color, Colors.red);
    });

    test('equality', () {
      const border1 = SquircleStadiumBorder(
        side: BorderSide(width: 2.0, color: Colors.red),
      );
      const border2 = SquircleStadiumBorder(
        side: BorderSide(width: 2.0, color: Colors.red),
      );
      const border3 = SquircleStadiumBorder(
        side: BorderSide(width: 3.0, color: Colors.blue),
      );

      expect(border1, equals(border2));
      expect(border1, isNot(equals(border3)));
    });

    test('lerp from null returns scaled border', () {
      const border = SquircleStadiumBorder(
        side: BorderSide(width: 2.0, color: Colors.red),
      );

      final lerped = border.lerpFrom(null, 0.5)! as SquircleStadiumBorder;

      expect(lerped.side.width, 1.0);
      expect(lerped.side.color, Colors.red.withOpacity(0.5));
    });
  });

  group('SquircleBorder', () {
    test('constructor assigns values correctly', () {
      const border = SquircleBorder(
        side: BorderSide(width: 2.0, color: Colors.blue),
        cornerRadius: 8.0,
      );

      expect(border.side.width, 2.0);
      expect(border.side.color, Colors.blue);
      expect(border.cornerRadius, 8.0);
    });

    test('scale returns new instance with scaled values', () {
      const border = SquircleBorder(
        side: BorderSide(width: 2.0, color: Colors.blue),
        cornerRadius: 8.0,
      );

      final scaled = border.scale(2.0) as SquircleBorder;

      expect(scaled.side.width, 4.0);
      expect(scaled.cornerRadius, 16.0);
    });

    test('equality', () {
      const border1 = SquircleBorder(
        side: BorderSide(width: 2.0, color: Colors.blue),
        cornerRadius: 8.0,
      );
      const border2 = SquircleBorder(
        side: BorderSide(width: 2.0, color: Colors.blue),
        cornerRadius: 8.0,
      );
      const border3 = SquircleBorder(
        side: BorderSide(width: 2.0, color: Colors.blue),
        cornerRadius: 12.0,
      );

      expect(border1, equals(border2));
      expect(border1, isNot(equals(border3)));
    });

    test('lerp interpolates values correctly', () {
      const border1 = SquircleBorder(
        side: BorderSide(width: 2.0, color: Colors.blue),
        cornerRadius: 8.0,
      );
      const border2 = SquircleBorder(
        side: BorderSide(width: 4.0, color: Colors.red),
        cornerRadius: 16.0,
      );

      final lerped = border1.lerpTo(border2, 0.5)! as SquircleBorder;

      expect(lerped.side.width, 3.0);
      expect(lerped.cornerRadius, 12.0);
      expect(
        lerped.side.color.value,
        Color.lerp(Colors.blue, Colors.red, 0.5)!.value,
      );
    });

    testWidgets('matches golden file', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RepaintBoundary(
          child: Material(
            shape: SquircleBorder(
              side: BorderSide(width: 2.0, color: Colors.blue),
              cornerRadius: 16.0,
            ),
            child: SizedBox(
              width: 100,
              height: 100,
            ),
          ),
        ),
      );

      expect(find.byType(Material), findsOneWidget);
      await expectLater(
        find.byType(RepaintBoundary),
        matchesGoldenFile('goldens/core_ui/squircle_border.png'),
      );
    });
  });

  group('Path generation', () {
    test('generates different paths for horizontal and vertical orientations',
        () {
      const border = SquircleStadiumBorder();

      const horizontalRect = Rect.fromLTWH(0, 0, 200, 100);
      const verticalRect = Rect.fromLTWH(0, 0, 100, 200);

      final horizontalPath = border.getOuterPath(horizontalRect);
      final verticalPath = border.getOuterPath(verticalRect);

      expect(horizontalPath, isNot(equals(verticalPath)));
    });

    test('respects border side width', () {
      const border = SquircleBorder(
        side: BorderSide(width: 4.0),
        cornerRadius: 8.0,
      );

      const rect = Rect.fromLTWH(0, 0, 100, 100);
      final path = border.getOuterPath(rect);
      final innerPath = border.getInnerPath(rect);

      expect(path, isNot(equals(innerPath)));
    });
  });
}
