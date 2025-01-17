import '/flutter_flow/flutter_flow_util.dart';
import 'reading_article_page_widget.dart' show ReadingArticlePageWidget;
import 'package:flutter/material.dart';

class ReadingArticlePageModel
    extends FlutterFlowModel<ReadingArticlePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
