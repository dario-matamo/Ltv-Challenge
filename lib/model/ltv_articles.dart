import 'dart:convert';
import 'package:ltv_flutter_challenge/model/article.dart';

LtvArticles ltvArticlesFromJson(String str) =>
    LtvArticles.fromJson(json.decode(str));

String ltvArticlesToJson(LtvArticles data) => json.encode(data.toJson());

class LtvArticles {
  LtvArticles({
    required this.lastRev,
    required this.articles,
  });

  String lastRev;
  List<Article> articles;

  factory LtvArticles.fromJson(Map<String, dynamic> json) => LtvArticles(
        lastRev: json["last_rev"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "last_rev": lastRev,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}
