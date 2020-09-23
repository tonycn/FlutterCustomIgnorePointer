import 'package:custom_ignore_pointer/src/render_self_ignore_pointer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

///
/// Hit test positive only if hitTestChildren is true
///

class SelfIgnorePointer extends SingleChildRenderObjectWidget {
  ///
  /// Creates a widget that is invisible to hit testing on itself.
  /// [hitTargetKey] Which responses the hit event.
  ///
  const SelfIgnorePointer({
    Key key,
    this.hitTargetKey,
    Widget child,
  }) : super(key: key, child: child);

  final GlobalKey hitTargetKey;

  @override
  RenderSelfIgnorePointer createRenderObject(BuildContext context) {
    return RenderSelfIgnorePointer(hitTargetKey: hitTargetKey);
  }

  @override
  void updateRenderObject(BuildContext context, RenderSelfIgnorePointer renderObject) {
    renderObject
      ..hitTargetKey = hitTargetKey;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<GlobalKey>('hitTargetKey', hitTargetKey));
  }
}