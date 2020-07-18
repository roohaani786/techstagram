class User {
  String id;
  String username;
  String email;

  User({this.id, this.username, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );
  }
}