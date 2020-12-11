class Preview {
  int id;
  double voteAverage;
  String title;
  String posterUrl;
  List<dynamic> genres;

  Preview({this.voteAverage, this.id, this.title, this.posterUrl, this.genres});

  Preview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    voteAverage = json['vote_average'];
    title = json['title'];
    posterUrl = json['poster_url'];
    genres = json['genres'];
  }
}
