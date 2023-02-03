class User {
  User({
    required this.id,
    required this.username,
    required this.oneId,
    required this.email,
    required this.isVerified,
    this.fullName,
    this.gender,
    this.dob,
    this.phone,
    this.maritalStatus,
    this.primaryAddress,
    this.secondaryAddress,
    this.country,
    this.postalCode,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['_id'],
        username: json['username'],
        oneId: json['oneId'],
        email: json['email'],
        isVerified: json['isVerified'],
        fullName: json['fullName'],
        gender: json['gender'],
        dob: DateTime.parse(json['dob']),
        phone: json['phone'],
        maritalStatus: json['maritalStatus'],
        primaryAddress: json['primaryAddress'],
        secondaryAddress: json['secondaryAddress'],
        country: json['country'],
        postalCode: json['postalCode'],
        token: json['token'],
      );

  final String id;
  final String username;
  final String oneId;
  final String email;
  final bool isVerified;
  final String? fullName;
  final String? gender;
  final DateTime? dob;
  final String? phone;
  final String? maritalStatus;
  final String? primaryAddress;
  final String? secondaryAddress;
  final String? country;
  final String? postalCode;
  final String token;
}
