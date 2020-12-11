import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokenlab/interfaces/api_requests_interface.dart';
import 'package:tokenlab/models/movie_model.dart';
import 'package:tokenlab/models/preview_model.dart';
import 'package:tokenlab/shared/consts.dart';

class ApiRequests implements IApiRequests {
  @override
  Future<List<Preview>> getPreviews() async {
    try {
      List<Preview> listPreviews = List();
      final response = await http.get(Consts.PREVIEWS_REQUEST_URL);
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        decodeJson.forEach((item) => listPreviews.add(Preview.fromJson(item)));
        return listPreviews;
      } else {
        print("Erro ao carregar lista de filmes " +
            response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar lista de filmesa " + stacktrace.toString());
      return null;
    }
  }

  @override
  Future<Movie> getMovie(int idMovie) async {
    try {
      Movie movie;
      final response =
          await http.get(Consts.MOVIE_REQUEST_URL + idMovie.toString());
      if (response.statusCode == 200) {
        var decodeJson = jsonDecode(response.body);
        movie = Movie.fromJson(decodeJson);
        return movie;
      } else {
        print(
            "Erro ao carregar dados do filme" + response.statusCode.toString());
        return null;
      }
    } catch (error, stacktrace) {
      print("Erro ao carregar dados do filme" + stacktrace.toString());
      return null;
    }
  }
}
