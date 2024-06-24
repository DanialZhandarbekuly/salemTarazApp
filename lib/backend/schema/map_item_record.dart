import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MapItemRecord extends FirestoreRecord {
  MapItemRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "docRef" field.
  DocumentReference? _docRef;
  DocumentReference? get docRef => _docRef;
  bool hasDocRef() => _docRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _docRef = snapshotData['docRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('mapItem');

  static Stream<MapItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MapItemRecord.fromSnapshot(s));

  static Future<MapItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MapItemRecord.fromSnapshot(s));

  static MapItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MapItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MapItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MapItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MapItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MapItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMapItemRecordData({
  String? name,
  LatLng? location,
  DocumentReference? docRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'docRef': docRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class MapItemRecordDocumentEquality implements Equality<MapItemRecord> {
  const MapItemRecordDocumentEquality();

  @override
  bool equals(MapItemRecord? e1, MapItemRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.docRef == e2?.docRef;
  }

  @override
  int hash(MapItemRecord? e) =>
      const ListEquality().hash([e?.name, e?.location, e?.docRef]);

  @override
  bool isValidKey(Object? o) => o is MapItemRecord;
}
