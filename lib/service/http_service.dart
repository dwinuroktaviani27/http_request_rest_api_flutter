import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '4f0a2da5ff7ebd67ece918155d96817f';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=4f0a2da5ff7ebd67ece918155d96817f&language=en-US&page=1';
  Future<String> getPopularMovies() async {
    final String uri = baseUrl;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return "";
    }
  }
}
