class User {
  final int id;
  final int pin;
  final String username;

  User(this.id, this.pin, this.username);
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['id'], json['pin'], json['username']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pin': pin,
      'username': username,
    };
  }
}
