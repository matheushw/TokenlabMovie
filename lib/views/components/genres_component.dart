import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/models/preview_model.dart';

class GenresCard extends StatelessWidget {
  final Preview preview;

  GenresCard({this.preview});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(8),
          color: Color(0xff2D383C),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: CachedNetworkImage(
                        imageUrl: preview.posterUrl,
                        placeholder: (context, url) => Center(
                          child: Container(
                            child: SpinKitFoldingCube(
                              color: Color(0xff0784B5),
                              size: 50.0,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          print(
                              'Não foi possivel carregar o baner da preview do filme com o id ${preview.id} ' +
                                  error.toString());
                          return Image.asset(
                              'assets/images/film_poster_placeholder.png',
                              fit: BoxFit.fill);
                        },
                        height: 201.0,
                        width: 134.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Flexible(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  preview.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  (preview.genres != null)
                                      ? preview.genres.join(", ")
                                      : '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                color: Color(0xffB59807),
                                size: 25,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(preview.voteAverage.toStringAsFixed(1),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                      color: Colors.white)),
                            ],
                          ),
                        ]),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/movie',
                                arguments: preview.id);
                          },
                          color: Theme.of(context).accentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Text(
                            "MORE INFO",
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
