import '/flutter_flow/flutter_flow_util.dart';
import 'sight_page_widget.dart' show SightPageWidget;
import 'package:flutter/material.dart';

class SightPageModel extends FlutterFlowModel<SightPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
