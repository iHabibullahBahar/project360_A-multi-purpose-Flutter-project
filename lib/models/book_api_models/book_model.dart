class BookModel {
  int? id;
  String? name;
  String? type;
  bool? available;

  BookModel({this.id, this.name, this.type, this.available});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['available'] = this.available;
    return data;
  }
}
