import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FindPartnerRecord extends FirestoreRecord {
  FindPartnerRecord._(
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

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  void _initializeFields() {
    _from = snapshotData['from'] as String?;
    _to = snapshotData['to'] as String?;
    _fromDate = snapshotData['fromDate'] as DateTime?;
    _toDate = snapshotData['toDate'] as DateTime?;
    _author = snapshotData['author'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('findPartner');

  static Stream<FindPartnerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FindPartnerRecord.fromSnapshot(s));

  static Future<FindPartnerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FindPartnerRecord.fromSnapshot(s));

  static FindPartnerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FindPartnerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FindPartnerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FindPartnerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FindPartnerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FindPartnerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFindPartnerRecordData({
  String? from,
  String? to,
  DateTime? fromDate,
  DateTime? toDate,
  DocumentReference? author,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'from': from,
      'to': to,
      'fromDate': fromDate,
      'toDate': toDate,
      'author': author,
    }.withoutNulls,
  );

  return firestoreData;
}

class FindPartnerRecordDocumentEquality implements Equality<FindPartnerRecord> {
  const FindPartnerRecordDocumentEquality();

  @override
  bool equals(FindPartnerRecord? e1, FindPartnerRecord? e2) {
    return e1?.from == e2?.from &&
        e1?.to == e2?.to &&
        e1?.fromDate == e2?.fromDate &&
        e1?.toDate == e2?.toDate &&
        e1?.author == e2?.author;
  }

  @override
  int hash(FindPartnerRecord? e) => const ListEquality()
      .hash([e?.from, e?.to, e?.fromDate, e?.toDate, e?.author]);

  @override
  bool isValidKey(Object? o) => o is FindPartnerRecord;
}
