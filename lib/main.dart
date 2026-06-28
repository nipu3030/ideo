import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideo/data/local/db_helper.dart';
import 'package:ideo/ui/bloc/idea_bloc.dart';
import 'package:ideo/ui/home_page.dart';
import 'package:ideo/ui/provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context)=> IdeaProvider(dbHelper: DBHelper.getInstance()),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomePage(),
    );
  }
}
