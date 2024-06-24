import '/flutter_flow/flutter_flow_util.dart';
import 'fav_areas_page_widget.dart' show FavAreasPageWidget;
import 'package:flutter/material.dart';

class FavAreasPageModel extends FlutterFlowModel<FavAreasPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
