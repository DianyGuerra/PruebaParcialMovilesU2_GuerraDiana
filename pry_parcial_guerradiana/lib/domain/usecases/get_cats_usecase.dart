import '../entities/cat.dart';
import '../../data/repositories/cat_repository_implementation.dart';

class GetCatsUseCase {
  // Instanciar el repositorio
  final CatRepositoryImplementation repository;

  GetCatsUseCase(this.repository);

  Future<List<Cat>> call() async {
    return repository.getCats(limit: 10);
  }
}
