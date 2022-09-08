import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request_rest_api_flutter/models/movie.dart';

class HttpService {
  final String apiKey = '4f0a2da5ff7ebd67ece918155d96817f';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=4f0a2da5ff7ebd67ece918155d96817f&language=en-US&page=1';
  Future<List> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviewsMap = jsonResponse['results'];
      List movies = moviewsMap.map((x) => Movie.fromJson(x)).toList();
      return movies;
    } else {
      print("Fail");
      return Future.value();
    }
  }
}
