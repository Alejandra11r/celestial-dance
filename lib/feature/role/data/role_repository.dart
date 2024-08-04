import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/either.dart';
import '../../../core/firebase_firestore_adapter.dart';
import '../../../core/properties.dart';
import 'role_model.dart';

class RoleRepository {
  RoleRepository({required this.firebaseFirestoreAdapter});
  final FirebaseFirestoreAdapter firebaseFirestoreAdapter;

  Future<Either<int, List<RoleModel>>> getGenders() async {
    final Either<int, List<QueryDocumentSnapshot<Map<String, dynamic>>>>
        result =
        await firebaseFirestoreAdapter.get(path: Properties.pathGender);
    return result.when(Left<int, List<RoleModel>>.new,
        (List<QueryDocumentSnapshot<Map<String, dynamic>>> right) {
      final List<RoleModel> list = <RoleModel>[];
      for (int i = 0; i < right.length; i++) {
        final Map<String, Object> json = <String, Object>{
          'id': right[i].id,
          'gender': right[i].data(),
        };
        list.add(RoleModel.fromJson(json));
      }
      return Right<int, List<RoleModel>>(list);
    });
  }
}
