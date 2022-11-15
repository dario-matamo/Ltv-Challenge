import 'package:http/http.dart' as http;
import 'package:ltv_flutter_challenge/model/ltv_articles.dart';

class ArticlesServices {
  static const String url =
      'https://hiring.ltvops.com/articles/index.mobile-ios.json';

  static Future<LtvArticles> getArticles() async {
    final LtvArticles listArticles;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      listArticles = ltvArticlesFromJson(response.body);
      return listArticles;
    }
    throw {Exception()};
  }

  //Updates image path to optimized version
  static String parseImagePath(String imagePath) {
    String updatedUrl =
        "https://hiring.ltvops.com/fit-in/60x0/filters:autojpg()/${imagePath.split("https://hiring.ltvops.com/")[1]}";
    return updatedUrl;
  }

  //Update date string
  static String parseDate(String date) {
    List<String> updatedDate = date.split(" ");
    updatedDate.removeRange(4, 6);
    String result = updatedDate.join(" ");
    return result;
  }
}
