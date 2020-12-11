import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/controllers/preview_controller.dart';
import 'package:tokenlab/views/components/best_movie_component.dart';
import 'package:tokenlab/views/components/genres_component.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PreviewController _previewController;

  @override
  void initState() {
    super.initState();
    _previewController = PreviewController();
    _previewController.loadPreviews();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          title: Image.asset(
            'assets/images/TokenLab_Logo.png',
            alignment: Alignment.topLeft,
            width: 150,
          ),
        ),
        body: Container(
          child: Observer(builder: (context) {
            final _previewList = _previewController.listPreview;
            return (_previewList == null)
                ? Center(
                    child: SpinKitFoldingCube(
                      color: Color(0xff0784B5),
                      size: 50.0,
                    ),
                  )
                : SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Best Movie',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900),
                            )),
                        BestMovieCard(
                            preview: _previewController.listPreview.first),
                        ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.transparent,
                                  height: 10,
                                ),
                            padding: EdgeInsets.all(5),
                            itemCount:
                                _previewController.listPreviewGenres.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                    child: Text(
                                        _previewController.listPreviewGenres
                                            .elementAt(index),
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                  Container(
                                    height: 200,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, subindex) =>
                                            SizedBox(
                                              width: 20,
                                            ),
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 8),
                                        itemCount: _previewController
                                            .getTitlesFromGenre(
                                                _previewController
                                                    .listPreviewGenres
                                                    .elementAt(index))
                                            .length,
                                        itemBuilder: (context, subindex) {
                                          return GenresCard(
                                              preview: _previewController
                                                  .getTitlesFromGenre(
                                                      _previewController
                                                          .listPreviewGenres
                                                          .elementAt(index))
                                                  .elementAt(subindex));
                                        }),
                                  ),
                                ],
                              );
                            })
                      ],
                    ),
                  );
          }),
        ));
  }
}
