import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/models/movie_model.dart';
import 'package:intl/intl.dart';

class CompleteMovieInfoCard extends StatelessWidget {
  final Movie movie;
  final currencyT = NumberFormat("#,##0.00", "en_US");

  CompleteMovieInfoCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Color(0xff2D383C),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 57,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: CachedNetworkImage(
                      imageUrl: movie.posterUrl,
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
                            'Não foi possivel carregar o baner do filme com o id ${movie.id} ' +
                                error.toString());
                        return Image.asset(
                          'assets/images/film_poster_placeholder.png',
                          fit: BoxFit.fill,
                        );
                      },
                      height: 247,
                      width: 165,
                      fit: BoxFit.fill,
                    ),
                  )),
              Flexible(
                flex: 43,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                          child: Text(
                            'Budget:',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff0784B5),
                                fontWeight: FontWeight.w900),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  'U\$ ${currencyT.format(movie.budget)}',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                          child: Text(
                            'Revenue:',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff0784B5),
                                fontWeight: FontWeight.w900),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Text(
                            'U\$ ${currencyT.format(movie.revenue)}',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                          child: Text(
                            'Runtime:',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff0784B5),
                                fontWeight: FontWeight.w900),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Text(
                            '${movie.runtime} min',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                          child: Text(
                            'Genres:',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff0784B5),
                                fontWeight: FontWeight.w900),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 0, 8.0, 8.0)),
                            Flexible(
                              child: Text(
                                (movie.genres != null)
                                    ? movie.genres.join(", ")
                                    : '',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                          child: Text(
                            'Release Date:',
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff0784B5),
                                fontWeight: FontWeight.w900),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
                          child: Text(
                            DateFormat("MM/dd/yyyy")
                                .format(DateTime.parse(movie.releaseDate)),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
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
