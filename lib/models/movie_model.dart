class Movie {
  
  String backdropUrl;
  int budget;
  List<dynamic> genres;
  int id;
  String overview;
  String posterUrl;
  List<dynamic> productionCompanies;
  String releaseDate;
  int revenue;
  int runtime;
  String title;
  double voteAverage;

  Movie({
    this.backdropUrl,
    this.budget,
    this.genres,
    this.id,
    this.overview,
    this.posterUrl,
    this.productionCompanies,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.title,
    this.voteAverage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    backdropUrl = json['backdrop_url'];
    budget = json['budget'];
    genres = json['genres'];
    id = json['id'];
    overview = json['overview'];
    posterUrl = json['poster_url'];
    productionCompanies = json['production_companies'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
}
