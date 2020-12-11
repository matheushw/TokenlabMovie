import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/models/movie_model.dart';

class BackDropCard extends StatelessWidget {
  final Movie movie;

  BackDropCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
                imageUrl: movie.backdropUrl,
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
                      'Não foi possivel carregar o backdrop do filme de id ${movie.id} ' +
                          error.toString());
                  return Image.asset('assets/images/Backdrop.png',
                      fit: BoxFit.fill);
                },
                fit: BoxFit.fill),
          ),
          Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.all(12)),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, bottom: 8.0),
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff39ACE7),
                              size: 30,
                            ),
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        (movie.genres != null) ? movie.genres.join(", ") : '',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 8),
                          child: Icon(
                            Icons.star_rounded,
                            color: Color(0xffB59807),
                            size: 25,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
