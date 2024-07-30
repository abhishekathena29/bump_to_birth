import 'package:cloud_firestore/cloud_firestore.dart';


class ForumPost {
  final String query;
  final String author;
  final Timestamp date;

  ForumPost({
    required this.query,
    required this.author,
    required this.date,
  });

Map<String, dynamic> toMap() {
return{
    'query': query,
    'author': author, 
    'date': date, 

};
}
factory ForumPost.fromMap(Map<String, dynamic> map) {
    return ForumPost(
      query: map['query'] ?? '',
      author: map['author'] ?? '',
      date: map['date'],
    );
  }

}

