class GenderModel {
  const GenderModel({
    required this.id,
    required this.gender,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
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
      
  GenderModel copyWith({
    int? idTmp,
    String? genderTmp,
  }) =>
      GenderModel(
        id: idTmp ?? id,
        gender: genderTmp ?? gender,
      );
}
