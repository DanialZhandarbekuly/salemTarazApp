import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SightRecord extends FirestoreRecord {
  SightRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _area = snapshotData['area'] as String?;
    _description = snapshotData['description'] as String?;
    _photoUrl = snapshotData['photoUrl'] as String?;
    _rating = castToType<double>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sight');

  static Stream<SightRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SightRecord.fromSnapshot(s));

  static Future<SightRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SightRecord.fromSnapshot(s));

  static SightRecord fromSnapshot(DocumentSnapshot snapshot) => SightRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SightRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SightRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SightRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SightRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSightRecordData({
  String? name,
  String? area,
  String? description,
  String? photoUrl,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'area': area,
      'description': description,
      'photoUrl': photoUrl,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class SightRecordDocumentEquality implements Equality<SightRecord> {
  const SightRecordDocumentEquality();

  @override
  bool equals(SightRecord? e1, SightRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.area == e2?.area &&
        e1?.description == e2?.description &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(SightRecord? e) => const ListEquality()
      .hash([e?.name, e?.area, e?.description, e?.photoUrl, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is SightRecord;
}
