import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/models/preview_model.dart';

class BestMovieCard extends StatelessWidget {
  final Preview preview;

  BestMovieCard({this.preview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Color(0xff2D383C),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              preview.title,
                              style: TextStyle(
                                  fontSize: 20,
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
                                  fontSize: 15,
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
                            size: 30,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(preview.voteAverage.toStringAsFixed(1),
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/movie',
                              arguments: preview.id);
                        },
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "MORE INFO",
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ]),
              ),
              Flexible(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: preview.posterUrl,
                      placeholder: (context, url) => Center(
                        child: SpinKitFoldingCube(
                          color: Color(0xff0784B5),
                          size: 50.0,
                        ),
                      ),
                      errorWidget: (context, url, error) {
                        print(
                            'Não foi possivel carregar o baner do melhor filme ' +
                                error.toString());
                        return Image.asset(
                            'assets/images/film_poster_placeholder.png',
                            fit: BoxFit.fill);
                      },
                      height: 201.0,
                      width: 134.0,
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
