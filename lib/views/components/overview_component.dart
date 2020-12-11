import 'package:flutter/material.dart';
import 'package:tokenlab/models/movie_model.dart';

class OverviewCard extends StatelessWidget {
  final Movie movie;

  OverviewCard({this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.only(left: 12, top: 10, bottom: 8),
            child: Text(
              'Overview',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            )),
        Padding(
          padding: EdgeInsets.only(left: 12, bottom: 12, right: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.all(10),
              color: Color(0xff2D383C),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  movie.overview,
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
