class Article {
  Article({
    this.title,
    this.description,
    this.author,
    this.image,
    this.articleDate,
    this.link,
    this.uuid,
  });

  String? title;
  String? description;
  String? author;
  String? image;
  String? articleDate;
  String? link;
  String? uuid;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        description: json["description"],
        author: json["author"],
        image: json["image"],
        articleDate: json["article_date"],
        link: json["link"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "author": author,
        "image": image,
        "article_date": articleDate,
        "link": link,
        "uuid": uuid,
      };
}
