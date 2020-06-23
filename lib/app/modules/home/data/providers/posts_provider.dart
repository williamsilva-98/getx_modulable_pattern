import 'dart:convert';
import 'package:getx_modular_pattern/app/modules/home/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

class PostsProvider {
  final http.Client httpClient;

  PostsProvider({@required this.httpClient});

  getAll() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Iterable jsonResponse = json.decode(response.body);
        List<PostModel> listMyModel = jsonResponse.map<PostModel>((map) {
          return PostModel.fromJson(map);
        }).toList();
        return listMyModel;
      } else
        print('erro -get');
    } catch (_) {}
  }
}
