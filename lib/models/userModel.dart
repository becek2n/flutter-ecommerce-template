class UserModel{
  final int id;
  final String userName;
  final String password;
  final String fullName;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String countryCode;
  final String photo;
  final int roleID;
  final DateTime dateCreated;
  final String createdBy;

  UserModel({
    this.id,
    this.userName,
    this.password,
    this.fullName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.countryCode,
    this.photo,
    this.roleID,
    this.dateCreated,
    this.createdBy
  });

  //mapping json data
  factory UserModel.fromJSON(Map<String, dynamic> jsonMap){
    final data = UserModel(
      id: jsonMap["ID"],
      userName: jsonMap["UserName"],
      password: jsonMap["Password"],
      fullName: jsonMap["FullName"],
      email: jsonMap["Email"],
      phone: jsonMap["Phone"],
      address: jsonMap["Address"],
      city: jsonMap["City"],
      countryCode: jsonMap["CountryCode"],
      photo: jsonMap["Photo"],
      roleID: jsonMap["RoleID"],
      dateCreated: jsonMap["DateCreated"],
      createdBy: jsonMap["CreatedBy"],
    );
    return data;
  }
}