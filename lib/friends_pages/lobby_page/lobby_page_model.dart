import '/flutter_flow/flutter_flow_util.dart';
import 'lobby_page_widget.dart' show LobbyPageWidget;
import 'package:flutter/material.dart';

class LobbyPageModel extends FlutterFlowModel<LobbyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
