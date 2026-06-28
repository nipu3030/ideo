import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ideo/ui/cubit/idea_cubit.dart';
import 'package:ideo/data/local/db_helper.dart';

import 'package:ideo/ui/home_page.dart';


void main() {
 runApp(BlocProvider(create: (context)=>IdeaCubit(dbHelper: DBHelper.getInstance()),child: MyApp(),));
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
