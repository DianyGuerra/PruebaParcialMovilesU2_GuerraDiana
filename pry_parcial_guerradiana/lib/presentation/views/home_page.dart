import 'package:flutter/material.dart';
import '../viewmodels/cat_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        Provider.of<CatViewModel>(context, listen: false).loadCats();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CatViewModel>(context);

    // Progress circle
    if (vm.loading) {
      return Scaffold(
        appBar: AppBar(title: Text('Gatitos')),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Gatitos')),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.8,
        ),
        itemCount: vm.cats.length,
        itemBuilder: (_, index) {
          final cat = vm.cats[index];
          return Card(
            elevation: 4.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                cat.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}