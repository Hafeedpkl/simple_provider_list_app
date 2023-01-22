import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_list_app/providers/movie_providers.dart';
import 'package:provider_simple_list_app/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    create: (context) => MovieProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
