import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_modular_pattern/app/data/providers/posts_provider.dart';
import 'package:getx_modular_pattern/app/data/repository/posts_repository.dart';
import 'package:http/http.dart' as http;
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  //repository injection
  final PostsRepository repository = PostsRepository(
    apiClient: PostsProvider(
      httpClient: http.Client(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Container(
        child: GetX<HomeController>(
          init: HomeController(repository: repository),
          builder: (_) {
            return _.postsList.length == 0
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _.postsList.length,
                    itemBuilder: (__, index) {
                      return ListTile(
                        title: Text(_.postsList[index].title),
                        subtitle: Text(_.postsList[index].body),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
