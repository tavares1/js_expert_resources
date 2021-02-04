import 'package:flutter/material.dart';
import 'package:flutter_dictionary/models/term.dart';

class TermDetailsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermDetailsPage');

  TermDetailsPage({Key key, this.term}) : super(key: key);

  final Term term;

  Widget termDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(term.definition,
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Spacer(),
        Row(
          children: [
            Text('Likes: ${term.likes}'),
            Padding(padding: EdgeInsets.all(16)),
            Text('Dislikes: ${term.dislikes}')
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(term.word),
      ),
      body: SafeArea(minimum: EdgeInsets.all(16), child: termDetails()),
    );
  }
}
