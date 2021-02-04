import 'package:flutter/material.dart';
import 'package:flutter_dictionary/pages/enter_term_page.dart';
import 'package:flutter_dictionary/models/term.dart';
import 'package:flutter_dictionary/pages/terms_details_page.dart';
import 'package:flutter_dictionary/pages/terms_page.dart';
import 'package:flutter_dictionary/services/network_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String _searchedTerm;
  Term _selectedTerm;
  List<Term> _terms;

  final _networkService = NetworkingService();

  void _searchForTerm(String term) async {
    final terms = await _networkService.defineTerm(term);
    setState(() {
      this._searchedTerm = term;
      this._terms = terms;
    });
  }

  void _didSelectTerm(Term term) {
    setState(() {
      this._selectedTerm = term;
      print(term.word);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Navigator(
          pages: [
            MaterialPage(
                key: EnterTermPage.valueKey,
                child: EnterTermPage(searchFormTerm: _searchForTerm)),
            if (_searchedTerm != null && _searchedTerm.isNotEmpty)
              MaterialPage(
                  key: TermsPage.valueKey,
                  child: TermsPage(
                    didSelectedTerm: _didSelectTerm,
                    title: _searchedTerm,
                    terms: this._terms,
                  )),
            if (_selectedTerm != null)
              MaterialPage(
                  key: TermDetailsPage.valueKey,
                  child: TermDetailsPage(
                    term: _selectedTerm,
                  ))
          ],
          onPopPage: (route, result) {
            final materialPage = route.settings as MaterialPage;
            final pageKey = materialPage.key;

            if (pageKey == TermsPage.valueKey) {
              _searchedTerm = null;
            }

            if (pageKey == TermDetailsPage.valueKey) {
              _selectedTerm = null;
            }

            return route.didPop(result);
          },
        ));
  }
}
