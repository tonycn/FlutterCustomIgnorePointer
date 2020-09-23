
import 'package:flutter/rendering.dart';

class RenderSelfIgnorePointer extends RenderProxyBox {
  /// Creates a render object that is invisible to hit testing.
  ///
  /// The [ignoring] argument must not be null. If [ignoringSemantics] is null,
  /// this render object will be ignored for semantics if [ignoring] is true.
  RenderSelfIgnorePointer({
    RenderBox child,
  }) : super(child);


  @override
  bool hitTestChildren(BoxHitTestResult result, { Offset position }) {
    return child?.hitTest(result, position: position) ?? false;
  }

  @override
  bool hitTestSelf(Offset position) => false;

}
