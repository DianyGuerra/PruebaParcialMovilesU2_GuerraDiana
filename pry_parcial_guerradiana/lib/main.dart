import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasource/cat_api_datasource.dart';
import 'data/repositories/cat_repository_implementation.dart';
import 'domain/usecases/get_cats_usecase.dart';
import 'presentation/viewmodels/cat_viewmodel.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  //inyección de dependencias
  //objeto se conecta a la API de Gatitos
  final datasource = CatApiDataSource(); //hace la petición http
  //usa el datasource para obtener datos (intermediario entre la UI y la API)
  final repository = CatRepositoryImplementation(datasource);
  //representa la lógica de negocio
  final usecase = GetCatsUseCase(repository);

  runApp(MyApp(usecase: usecase));
}

class MyApp extends StatelessWidget {
  final GetCatsUseCase usecase;
  const MyApp({super.key, required this.usecase});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CatViewModel(usecase),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: "/",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
      ),
    );
  }
}

