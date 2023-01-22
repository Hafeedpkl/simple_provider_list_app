import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_list_app/providers/movie_providers.dart';

class MyLIstScreen extends StatelessWidget {
  MyLIstScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(title: Text('My List (${myList.length})')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final currentMovie = myList[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? ' '),
              trailing: TextButton(
                  onPressed: () {
                    context.read<MovieProvider>().removeFromList(currentMovie);
                  },
                  child: Text('remove')),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: myList.length,
      ),
    );
  }
}
