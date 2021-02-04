import 'dart:convert';

import 'package:flutter_dictionary/models/define_term_response.dart';
import 'package:flutter_dictionary/models/term.dart';
import 'package:http/http.dart' as http;

class NetworkingService {
  Future<List<Term>> defineTerm(String searchTerm) async {
    final queryParameters = {'term': searchTerm};

    final uri = Uri.https(
      'mashape-community-urban-dictionary.p.rapidapi.com',
      'define',
      queryParameters,
    );

    final headers = {
      "x-rapidapi-key": "fdce519fcbmsh7c57dcb546f667ap131afdjsn8d150c3ab1e2",
      "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com"
    };

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final decodeBody = jsonDecode(response.body);
      final defineTermsResponse = DefineTermResponse.fromJson(decodeBody);
      return defineTermsResponse.list;
    } else {
      throw Exception('Failed to define term');
    }
  }
}
