// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preview_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreviewController on _PreviewControllerBase, Store {
  final _$listPreviewAtom = Atom(name: '_PreviewControllerBase.listPreview');

  @override
  ObservableList<Preview> get listPreview {
    _$listPreviewAtom.reportRead();
    return super.listPreview;
  }

  @override
  set listPreview(ObservableList<Preview> value) {
    _$listPreviewAtom.reportWrite(value, super.listPreview, () {
      super.listPreview = value;
    });
  }

  final _$listPreviewGenresAtom =
      Atom(name: '_PreviewControllerBase.listPreviewGenres');

  @override
  ObservableSet<String> get listPreviewGenres {
    _$listPreviewGenresAtom.reportRead();
    return super.listPreviewGenres;
  }

  @override
  set listPreviewGenres(ObservableSet<String> value) {
    _$listPreviewGenresAtom.reportWrite(value, super.listPreviewGenres, () {
      super.listPreviewGenres = value;
    });
  }

  final _$movieAtom = Atom(name: '_PreviewControllerBase.movie');

  @override
  Movie get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$loadPreviewsAsyncAction =
      AsyncAction('_PreviewControllerBase.loadPreviews');

  @override
  Future loadPreviews() {
    return _$loadPreviewsAsyncAction.run(() => super.loadPreviews());
  }

  final _$loadMovieAsyncAction =
      AsyncAction('_PreviewControllerBase.loadMovie');

  @override
  Future loadMovie({int idMovie}) {
    return _$loadMovieAsyncAction.run(() => super.loadMovie(idMovie: idMovie));
  }

  final _$_PreviewControllerBaseActionController =
      ActionController(name: '_PreviewControllerBase');

  @override
  dynamic loadPreviewsGenres() {
    final _$actionInfo = _$_PreviewControllerBaseActionController.startAction(
        name: '_PreviewControllerBase.loadPreviewsGenres');
    try {
      return super.loadPreviewsGenres();
    } finally {
      _$_PreviewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Preview> getTitlesFromGenre(String genre) {
    final _$actionInfo = _$_PreviewControllerBaseActionController.startAction(
        name: '_PreviewControllerBase.getTitlesFromGenre');
    try {
      return super.getTitlesFromGenre(genre);
    } finally {
      _$_PreviewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listPreview: ${listPreview},
listPreviewGenres: ${listPreviewGenres},
movie: ${movie}
    ''';
  }
}
