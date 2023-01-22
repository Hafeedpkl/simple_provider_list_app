import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_simple_list_app/providers/movie_providers.dart';
import 'package:provider_simple_list_app/screens/fav_screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;

    return Scaffold(
      appBar: AppBar(title: Text('Provider List')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyLIstScreen(),
                  ));
            },
            icon: Icon(Icons.favorite),
            label: Text('My List (${myList.length})'),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) {
              final currentMovie = movies[index];
              return Card(
                key: ValueKey(currentMovie.title),
                color: Colors.blue,
                elevation: 4,
                child: ListTile(
                  title: Text(
                    currentMovie.title,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    currentMovie.duration ?? 'No information',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: myList.contains(currentMovie)
                          ? Colors.red
                          : Colors.white,
                    ),
                    onPressed: () {
                      if (!myList.contains(currentMovie)) {
                        context.read<MovieProvider>().addToList(currentMovie);
                      } else {
                        context
                            .read<MovieProvider>()
                            .removeFromList(currentMovie);
                      }
                    },
                  ),
                ),
              );
            },
          ))
        ]),
      ),
    );
  }
}
