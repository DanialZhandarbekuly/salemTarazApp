import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatPersonRecord extends FirestoreRecord {
  ChatPersonRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "messages" field.
  List<DocumentReference>? _messages;
  List<DocumentReference> get messages => _messages ?? const [];
  bool hasMessages() => _messages != null;

  void _initializeFields() {
    _messages = getDataList(snapshotData['messages']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatPerson');

  static Stream<ChatPersonRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatPersonRecord.fromSnapshot(s));

  static Future<ChatPersonRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatPersonRecord.fromSnapshot(s));

  static ChatPersonRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatPersonRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatPersonRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatPersonRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatPersonRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatPersonRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatPersonRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class ChatPersonRecordDocumentEquality implements Equality<ChatPersonRecord> {
  const ChatPersonRecordDocumentEquality();

  @override
  bool equals(ChatPersonRecord? e1, ChatPersonRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.messages, e2?.messages);
  }

  @override
  int hash(ChatPersonRecord? e) => const ListEquality().hash([e?.messages]);

  @override
  bool isValidKey(Object? o) => o is ChatPersonRecord;
}
