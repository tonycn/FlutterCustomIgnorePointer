import 'package:custom_ignore_pointer/src/render_self_ignore_pointer.dart';
import 'package:flutter/widgets.dart';

///
/// Hit test positive only if hitTestChildren is true
///

class SelfIgnorePointer extends SingleChildRenderObjectWidget {
  /// Creates a widget that is invisible to hit testing on itself.
  ///
  const SelfIgnorePointer({
    Key key,
    Widget child,
  }) : super(key: key, child: child);


  @override
  RenderSelfIgnorePointer createRenderObject(BuildContext context) {
    return RenderSelfIgnorePointer();
  }

  @override
  void updateRenderObject(BuildContext context, RenderSelfIgnorePointer renderObject) { }

}