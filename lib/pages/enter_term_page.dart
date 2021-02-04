import 'package:flutter/material.dart';

class EnterTermPage extends StatefulWidget {
  static final valueKey = ValueKey('EnterTermPage');

  ValueChanged<String> searchFormTerm;

  EnterTermPage({Key key, this.searchFormTerm}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EnterTermPageState();
}

class _EnterTermPageState extends State<EnterTermPage> {
  final _textFieldController = TextEditingController();

  _search() {
    widget.searchFormTerm(_textFieldController.text);
  }

  Widget searchForm() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textFieldController,
            decoration: InputDecoration(labelText: 'Enter Term'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: FlatButton(
                onPressed: () => _search(),
                child: Text("Search"),
                color: Colors.purple,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Urban Dictionary'),
      ),
      body: searchForm(),
    );
  }
}
