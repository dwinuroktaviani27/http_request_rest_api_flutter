import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/service/http_service.dart';

class Movielist extends StatefulWidget {
  @override
  _MovielistState createState() => _MovielistState();
}

class _MovielistState extends State<Movielist> {
  String result = "";
  late HttpService service;
  @override
  void initState() {
    super.initState();
    service = HttpService();
  }

  Widget build(BuildContext context) {
    service.getPopularMovies().then((value) => {
          setState(() {
            result = value;
          })
        });
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}
