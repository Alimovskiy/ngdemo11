class User {
  int? id;
  String? userName;

  User({this.id, this.userName});

  User.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        userName = json['username'];

  Map<String, dynamic> toMap() => {
    'id': id,
    'username': userName
  };
}
