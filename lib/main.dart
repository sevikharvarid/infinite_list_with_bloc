import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_with_bloc/bloc/post_bloc.dart';
import 'package:infinite_list_with_bloc/bloc/post_event.dart';
import 'package:infinite_list_with_bloc/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PostBloc()..add(PostStarted()),
        child: MainPage(),
      ),
    );
  }
}
