import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';

class Movielist extends StatefulWidget {
  @override
  _MovielistState createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  int? moviesCount;
  List? movies;
  String result = "";
  HttpService? service;

  Future initialize() async {
    movies = [];
    movies = await service!.getPopularMovies();
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                title: Text(movies![position].title),
                subtitle: Text(
                  'Rating = ' + movies![position].voteAverage.toString(),
                ),
              ),
            );
          },
        ));
  }
}
