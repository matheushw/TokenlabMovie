import 'package:mobx/mobx.dart';
import 'package:tokenlab/models/movie_model.dart';
import 'package:tokenlab/models/preview_model.dart';
import 'package:tokenlab/repositories/api_requests.dart';

part 'preview_controller.g.dart';

class PreviewController = _PreviewControllerBase with _$PreviewController;

abstract class _PreviewControllerBase with Store {
  ApiRequests _previewRepository;

  _PreviewControllerBase() {
    _previewRepository = ApiRequests();
  }

  @observable
  ObservableList<Preview> listPreview;

  @observable
  ObservableSet<String> listPreviewGenres = new ObservableSet<String>();

  @observable
  Movie movie;

  @action
  loadPreviewsGenres() {
    listPreview.forEach((element) => element.genres
        .forEach((subelement) => listPreviewGenres.add(subelement.toString())));
  }

  @action
  loadPreviews() async {
    listPreview =
        ObservableList<Preview>.of(await _previewRepository.getPreviews());
    listPreview.sort((a, b) => b.voteAverage.compareTo(a.voteAverage));
    loadPreviewsGenres();
  }

  @action
  loadMovie({int idMovie}) async {
    movie = await _previewRepository.getMovie(idMovie);
  }

  @action
  List<Preview> getTitlesFromGenre(String genre) {
    List<Preview> titles = [];
    listPreview.forEach((element) {
      if (element.genres.contains(genre)) {
        titles.add(element);
      }
    });
    return titles;
  }
}
