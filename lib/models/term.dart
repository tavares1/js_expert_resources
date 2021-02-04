class Term {
  Term({this.word, this.definition, this.likes, this.dislikes});

  String word;
  String definition;
  int likes;
  int dislikes;

  Term.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        definition = json['definition'],
        likes = json['thumbs_up'],
        dislikes = json['thumbs_down'];
}
