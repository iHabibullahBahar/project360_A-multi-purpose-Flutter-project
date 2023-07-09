class User {
  String? createdAt;
  String? name;
  String? avatar;
  String? phone;
  String? email;
  String? id;

  User(
      {this.createdAt,
      this.name,
      this.avatar,
      this.phone,
      this.email,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
