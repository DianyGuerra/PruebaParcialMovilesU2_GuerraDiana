import 'package:flutter/material.dart';
import '../../domain/entities/cat.dart';
import '../../domain/usecases/get_cats_usecase.dart';

class CatViewModel extends ChangeNotifier {
  final GetCatsUseCase getCatsUseCase;

  CatViewModel(this.getCatsUseCase);

  // Manejo del estado
  List<Cat> cats = [];
  bool loading = false;
  String? errorMessage;

  Future<void> loadCats() async {
    loading = true;
    notifyListeners();
    try {
      cats = await getCatsUseCase();
    } catch (e) {
      errorMessage = "Error al cargar los datos";
    }
    loading = false;
    notifyListeners();
  }
}
