import 'package:getx_modular_pattern/app/data/providers/posts_provider.dart';
import 'package:meta/meta.dart';

class PostsRepository {
  final PostsProvider apiClient;

  PostsRepository({@required this.apiClient}) : assert(apiClient != null);

  getAll() {
    return apiClient.getAll();
  }
}
