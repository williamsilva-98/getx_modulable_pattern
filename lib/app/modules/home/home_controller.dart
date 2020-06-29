import 'package:get/get.dart';
import 'package:getx_modular_pattern/app/data/models/post_model.dart';
import 'package:getx_modular_pattern/app/data/repository/posts_repository.dart';
import 'package:meta/meta.dart';

class HomeController extends RxController {
  final PostsRepository repository;

  HomeController({@required this.repository}) : assert(repository != null);

  @override
  void onInit() {
    getAll();
    super.onInit();
  }

  final _postsList = List<PostModel>().obs;

  get postsList => this._postsList.value;

  set postsList(value) => this._postsList.value = value;

  getAll() {
    repository.getAll().then((data) {
      this.postsList = data;
    });
  }
}
