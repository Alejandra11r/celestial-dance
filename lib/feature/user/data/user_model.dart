// class UserModel {
//   UserModel({
//     required this.name,
//     required this.lastname,
//     required this.age,
//     required this.arrivalDate,
//     required this.isBaptized,
//     required this.phoneNumber,
//     required this.address,
//     required this.role,
//     required this.school,
//     required this.gender,
//   });
//   final String name;
//   final String lastname;
//   final String age;
//   final String arrivalDate;
//   final String isBaptized;
//   final String phoneNumber;
//   final String address;
//   final String role;
//   final String school;
//   final String gender;

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//     };
//   }
// }
