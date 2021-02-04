import 'package:flutter/material.dart';
import 'package:flutter_dictionary/models/term.dart';

class TermsPage extends StatelessWidget {
  static final valueKey = ValueKey('TermsPageKey');

  final String title;
  final List<Term> terms;
  final ValueChanged<Term> didSelectedTerm;

  TermsPage({Key key, this.title, this.terms, this.didSelectedTerm})
      : super(key: key);

  Widget termsList() {
    return ListView.builder(
        itemCount: terms.length,
        itemBuilder: (context, index) {
          final term = terms[index];
          return Card(
            child: ListTile(
              title: Text(term.word),
              subtitle: Text(term.definition),
              onTap: () => this.didSelectedTerm(term),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16), child: termsList()),
    );
  }
}
