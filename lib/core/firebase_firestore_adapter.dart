import 'package:cloud_firestore/cloud_firestore.dart';
import 'either.dart';

class FirebaseFirestoreAdapter {
  FirebaseFirestoreAdapter._();

  static final FirebaseFirestoreAdapter _instance =
      FirebaseFirestoreAdapter._();
  static FirebaseFirestoreAdapter getInstance() => _instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<Either<int, List<QueryDocumentSnapshot<Map<String, dynamic>>>>>
      get<T>({
    required String path,
  }) async {
    try {
      return await _db.collection(path).get().then(
            (QuerySnapshot<Map<String, dynamic>> event) =>
                Right<int, List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
              event.docs,
            ),
          );
    } on FirebaseException catch (e) {
      return Left<int, List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
        int.parse(e.code),
      );
    }
  }
}
