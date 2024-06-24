import '/flutter_flow/flutter_flow_util.dart';
import 'chat_person_page_widget.dart' show ChatPersonPageWidget;
import 'package:flutter/material.dart';

class ChatPersonPageModel extends FlutterFlowModel<ChatPersonPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
