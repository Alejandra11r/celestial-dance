class RoleModel {
  const RoleModel({
    required this.id,
    required this.gender,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: int.parse(
          json['id'] != null ? json['id'].toString() : '0',
        ),
        gender: (json['gender'] ?? '').toString(),
      );

  final int id;
  final String gender;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'gender': gender,
      };
      
  RoleModel copyWith({
    int? idTmp,
    String? genderTmp,
  }) =>
      RoleModel(
        id: idTmp ?? id,
        gender: genderTmp ?? gender,
      );
}
