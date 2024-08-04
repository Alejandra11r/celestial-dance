import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/either.dart';
import '../../../core/firebase_firestore_adapter.dart';
import '../../../core/properties.dart';
import 'gender_model.dart';

class GenderRepository {
  GenderRepository({required this.firebaseFirestoreAdapter});
  final FirebaseFirestoreAdapter firebaseFirestoreAdapter;

  Future<Either<int, List<GenderModel>>> getGenders() async {
    final Either<int, List<QueryDocumentSnapshot<Map<String, dynamic>>>>
        result =
        await firebaseFirestoreAdapter.get(path: Properties.pathGender);
    return result.when(Left<int, List<GenderModel>>.new,
        (List<QueryDocumentSnapshot<Map<String, dynamic>>> right) {
      final List<GenderModel> list = <GenderModel>[];
      for (int i = 0; i < right.length; i++) {
        final Map<String, Object> json = <String, Object>{
          'id': right[i].id,
          'gender': right[i].data(),
        };
        list.add(GenderModel.fromJson(json));
      }
      return Right<int, List<GenderModel>>(list);
    });
  }
}
