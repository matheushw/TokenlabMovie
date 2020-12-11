import 'package:tokenlab/models/movie_model.dart';
import 'package:tokenlab/models/preview_model.dart';

abstract class IApiRequests {
  Future<List<Preview>> getPreviews();
  Future<Movie> getMovie(int idMovie);
}
