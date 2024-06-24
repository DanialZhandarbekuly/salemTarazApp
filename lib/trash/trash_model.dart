import '/flutter_flow/flutter_flow_util.dart';
import 'trash_widget.dart' show TrashWidget;
import 'package:flutter/material.dart';

class TrashModel extends FlutterFlowModel<TrashWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
