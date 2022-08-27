// ignore_for_file: dead_code

class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? image_url;

  UserModel(
      {this.uid,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.image_url});

  //receiving Data From Server
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map["uid"],
        name: map['name'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        password: map['password'],
        image_url: map['image_url']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'image_url': image_url,
    };
  }
}
