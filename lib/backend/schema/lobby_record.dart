import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LobbyRecord extends FirestoreRecord {
  LobbyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "from" field.
  String? _from;
  String get from => _from ?? '';
  bool hasFrom() => _from != null;

  // "to" field.
  String? _to;
  String get to => _to ?? '';
  bool hasTo() => _to != null;

  // "fromDate" field.
  DateTime? _fromDate;
  DateTime? get fromDate => _fromDate;
  bool hasFromDate() => _fromDate != null;

  // "toDate" field.
  DateTime? _toDate;
  DateTime? get toDate => _toDate;
  bool hasToDate() => _toDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "members" field.
  List<DocumentReference>? _members;
  List<DocumentReference> get members => _members ?? const [];
  bool hasMembers() => _members != null;

  void _initializeFields() {
    _from = snapshotData['from'] as String?;
    _to = snapshotData['to'] as String?;
    _fromDate = snapshotData['fromDate'] as DateTime?;
    _toDate = snapshotData['toDate'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _members = getDataList(snapshotData['members']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lobby');

  static Stream<LobbyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LobbyRecord.fromSnapshot(s));

  static Future<LobbyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LobbyRecord.fromSnapshot(s));

  static LobbyRecord fromSnapshot(DocumentSnapshot snapshot) => LobbyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LobbyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LobbyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LobbyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LobbyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLobbyRecordData({
  String? from,
  String? to,
  DateTime? fromDate,
  DateTime? toDate,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'from': from,
      'to': to,
      'fromDate': fromDate,
      'toDate': toDate,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class LobbyRecordDocumentEquality implements Equality<LobbyRecord> {
  const LobbyRecordDocumentEquality();

  @override
  bool equals(LobbyRecord? e1, LobbyRecord? e2) {
    const listEquality = ListEquality();
    return e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.fromDate == e2?.fromDate &&
        e1?.toDate == e2?.toDate &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.members, e2?.members);
  }

  @override
  int hash(LobbyRecord? e) => const ListEquality()
      .hash([e?.from, e?.to, e?.fromDate, e?.toDate, e?.name, e?.members]);

  @override
  bool isValidKey(Object? o) => o is LobbyRecord;
}
