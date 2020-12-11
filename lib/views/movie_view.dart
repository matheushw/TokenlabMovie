import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/controllers/preview_controller.dart';
import 'package:tokenlab/views/components/backdrop_component.dart';
import 'package:tokenlab/views/components/complete_info_component.dart';
import 'package:tokenlab/views/components/overview_component.dart';
import 'package:tokenlab/views/components/production_companies_component.dart';

class MovieView extends StatefulWidget {
  final int idMovie;

  const MovieView({Key key, this.idMovie}) : super(key: key);
  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  PreviewController _previewController;

  @override
  void initState() {
    super.initState();
    _previewController = PreviewController();
    _previewController.loadMovie(idMovie: widget.idMovie);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Observer(builder: (context) {
          final _movie = _previewController.movie;
          return (_movie == null)
              ? Center(
                  child: SpinKitFoldingCube(
                    color: Color(0xff0784B5),
                    size: 50.0,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 33,
                      child: BackDropCard(movie: _movie),
                    ),
                    Flexible(
                      flex: 67,
                      child: SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                CompleteMovieInfoCard(movie: _movie),
                                OverviewCard(movie: _movie),
                                ProductionCompaniesCard(movie: _movie),
                              ])),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
