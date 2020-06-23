class PostModel {
  int id;
  String title;
  String body;

  PostModel({
    this.id,
    this.title,
    this.body,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.body = json['body'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': this.title,
      'body': this.body,
    };
  }
}
