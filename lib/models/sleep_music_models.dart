class SleepMusic {
  String? name;
  String? timeDuration;
  String? description;
  double? countFavorite;
  double? countListening;
  String? image;
  String? genre;
  String? urlMusic;
  List<SleepMusic>? relatedMusic ;
  SleepMusic({this.name,this.timeDuration, this.description, this.countFavorite, this.countListening, this.relatedMusic, this.image, this.genre, this.urlMusic});
}