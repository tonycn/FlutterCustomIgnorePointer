
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderSelfIgnorePointer extends RenderProxyBox {
  /// Creates a render object that is invisible to hit testing.
  ///
  /// The [ignoring] argument must not be null. If [ignoringSemantics] is null,
  /// this render object will be ignored for semantics if [ignoring] is true.
  RenderSelfIgnorePointer({
    GlobalKey hitTargetKey,
    RenderBox child,
  }) : _hitTargetKey = hitTargetKey, super(child) {
    assert(hitTargetKey != null);
  }

  GlobalKey get hitTargetKey => _hitTargetKey;
  GlobalKey _hitTargetKey;
  set hitTargetKey(GlobalKey value) {
    assert(value != null);
    _hitTargetKey = value;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, { Offset position }) {
    final globalPosition = localToGlobal(position);
    final targetObject = hitTargetKey.currentContext?.findRenderObject() as RenderBox;
    assert(targetObject != null, 'Check render box of hitTargetKey, should not be null.');
    return targetObject?.hitTest(result, position: targetObject.globalToLocal(globalPosition)) ?? false;
  }

  @override
  bool hitTestSelf(Offset position) => false;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GlobalKey>('hitTargetKey', hitTargetKey));
  }

}
