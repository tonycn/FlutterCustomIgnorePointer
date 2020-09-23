import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:custom_ignore_pointer/custom_ignore_pointer.dart';

void main() {
  test('adds one to input values', () {

  });

  testWidgets('Test on self', (WidgetTester tester) async {
    final aSelfIgnorePointerKey = GlobalKey();
    final topContainerKey = GlobalKey();
    final topContainerKey2 = GlobalKey();
    final underContainerKey = GlobalKey();

    await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Container(
              width: 1000,
              height: 1000,
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: Container(
                      key: underContainerKey,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    right: 0,
                    child: SelfIgnorePointer(
                      key: aSelfIgnorePointerKey,
                      hitTargetKey: topContainerKey,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 50,
                            top: 50,
                            child: Container(
                              key: topContainerKey,
                              color: Colors.red,
                              width: 500,
                              height: 500,
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 50,
                            child: Container(
                              key: topContainerKey2,
                              color: Colors.red,
                              width: 500,
                              height: 500,
                            ),
                          )
                        ],
                      )
                    ),
                  )
                ],
              ),
            )
          )
        )
    );

    final selfIgnoreRenderObj = tester.renderObject(find.byKey(aSelfIgnorePointerKey));
    final topContainer = tester.renderObject(find.byKey(topContainerKey));
    final underContainer = tester.renderObject(find.byKey(underContainerKey));

    expect(tester.hitTestOnBinding(Offset(40, 40)), doesNotHit(selfIgnoreRenderObj));
    expect(tester.hitTestOnBinding(Offset(10, 10)), hits(underContainer));
    expect(tester.hitTestOnBinding(Offset(140, 140)), hits(topContainer));
  });
}

DoesNotHitRenderBox doesNotHit(RenderBox renderBox) => DoesNotHitRenderBox(renderBox);

class DoesNotHitRenderBox extends Matcher {
  const DoesNotHitRenderBox(this.renderBox);

  final RenderBox renderBox;

  @override
  Description describe(Description description) =>
    description.add("hit test result doesn't contain ").addDescriptionOf(renderBox);

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    final HitTestResult hitTestResult = item as HitTestResult;
    return hitTestResult.path.where(
      (HitTestEntry entry) => entry.target == renderBox
    ).isEmpty;
  }
}

HitsRenderBox hits(RenderBox renderBox) => HitsRenderBox(renderBox);

class HitsRenderBox extends Matcher {
  const HitsRenderBox(this.renderBox);

  final RenderBox renderBox;

  @override
  Description describe(Description description) =>
    description.add('hit test result contains ').addDescriptionOf(renderBox);

  @override
  bool matches(dynamic item, Map<dynamic, dynamic> matchState) {
    final HitTestResult hitTestResult = item as HitTestResult;
    return hitTestResult.path.where(
      (HitTestEntry entry) => entry.target == renderBox
    ).isNotEmpty;
  }
}

