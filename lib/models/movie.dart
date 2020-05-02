class Movie {
  String _name;
  double _rating;
  String _posterUrl;
  List<String> _genere;
  String _duration;
  String _director;
  String _releaseYear;
  Movie(this._name, this._genere, this._rating, this._posterUrl, this._duration,
      this._director, this._releaseYear);
  Movie fromMap(Map map) {
    return Movie(map['Name'], map['Rating'], map['PosterUrl'], map['Genere'],
        map['Director'], map['Duration'], map['ReleaseYear']);
  }

  Map<dynamic,dynamic> toMap(Movie movie) {
    return {
      'Name': movie._name,
      'Rating': movie._rating,
      'PosterUrl': movie._posterUrl,
      'Genere': movie._genere.toString(),
      'Duration': movie._duration,
      'Director': movie._director,
      'ReleaseYear': movie._releaseYear
    };
  }

  String getName() => _name;
  double getRating() => _rating;
  String getPosterUrl() => _posterUrl;
  List<String>getGenere() => _genere;
  String getDuration() => _duration;
  String getDirector() => _director;
  String getReleaseYear() => _releaseYear;
}
