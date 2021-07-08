import 'dart:convert';
import 'package:recipe_flutter/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static get http => null;

  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"start": "0", "limit": "18", "tag": "list.recipe.popular"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "f8e028f1d6mshd91d773f4a7d6c2p1fe987jsnb1482dd6ef35",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
