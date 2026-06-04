import '../../domain/entities/cat.dart';
import '../datasource/cat_api_datasource.dart';

class CatRepositoryImplementation {
  final CatApiDataSource datasource;

  CatRepositoryImplementation(this.datasource);

  Future<List<Cat>> getCats({int limit = 10}) async {
    return datasource.fetchCats(limit);
  }
}
