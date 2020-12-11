import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tokenlab/models/movie_model.dart';

class ProductionCompaniesCard extends StatelessWidget {
  final Movie movie;

  ProductionCompaniesCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 8),
            child: Text(
              'Production Companies',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            )),
        Container(
          height: 100,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                    width: 5,
                  ),
              itemCount: movie.productionCompanies.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 12, bottom: 12, right: 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Color(0xff2D383C),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text(
                                movie.productionCompanies
                                    .elementAt(index)['name'],
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Container(
                              child: (movie.productionCompanies
                                          .elementAt(index)['logo_url'] ==
                                      null)
                                  ? Container()
                                  : CachedNetworkImage(
                                      imageUrl: movie.productionCompanies
                                          .elementAt(index)['logo_url'],
                                      placeholder: (context, url) => Center(
                                        child: Container(
                                          child: SpinKitFoldingCube(
                                            color: Color(0xff0784B5),
                                            size: 50.0,
                                          ),
                                        ),
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
