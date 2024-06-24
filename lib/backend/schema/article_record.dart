import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleRecord extends FirestoreRecord {
  ArticleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "timeBefore" field.
  int? _timeBefore;
  int get timeBefore => _timeBefore ?? 0;
  bool hasTimeBefore() => _timeBefore != null;

  // "createsData" field.
  DateTime? _createsData;
  DateTime? get createsData => _createsData;
  bool hasCreatesData() => _createsData != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
    _likes = castToType<int>(snapshotData['likes']);
    _author = snapshotData['author'] as DocumentReference?;
    _timeBefore = castToType<int>(snapshotData['timeBefore']);
    _createsData = snapshotData['createsData'] as DateTime?;
    _photoUrl = snapshotData['photoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('article');

  static Stream<ArticleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticleRecord.fromSnapshot(s));

  static Future<ArticleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticleRecord.fromSnapshot(s));

  static ArticleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticleRecordData({
  String? title,
  String? text,
  int? likes,
  DocumentReference? author,
  int? timeBefore,
  DateTime? createsData,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'text': text,
      'likes': likes,
      'author': author,
      'timeBefore': timeBefore,
      'createsData': createsData,
      'photoUrl': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticleRecordDocumentEquality implements Equality<ArticleRecord> {
  const ArticleRecordDocumentEquality();

  @override
  bool equals(ArticleRecord? e1, ArticleRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.text == e2?.text &&
        e1?.likes == e2?.likes &&
        e1?.author == e2?.author &&
        e1?.timeBefore == e2?.timeBefore &&
        e1?.createsData == e2?.createsData &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(ArticleRecord? e) => const ListEquality().hash([
        e?.title,
        e?.text,
        e?.likes,
        e?.author,
        e?.timeBefore,
        e?.createsData,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticleRecord;
}
