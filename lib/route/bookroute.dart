import 'package:flutter/material.dart';

class BookRoute extends StatefulWidget {
  @override
  BookRouteState createState() => new BookRouteState();
}

class BookRouteState extends State<BookRoute> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List _BookTypes = ["Roman", "Polar", "Fantasy", "SF", "Culture"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _defaultBookTypes;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _defaultBookTypes = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String BookType in _BookTypes) {
      items.add(new DropdownMenuItem(
          value: BookType,
          child: new Text(BookType)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Nouvelle série : Livre"),
        backgroundColor: Colors.deepPurple,
      ),

      body: new Container (
        padding: const EdgeInsets.all(10.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                  decoration: new InputDecoration(
                      hintText: '',
                      labelText: 'Nom série'
                  )
              ),

              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
              ),

              new DropdownButton(
                value: _defaultBookTypes,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),

              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
              ),

              new TextFormField(
                  decoration: new InputDecoration(
                      hintText: '',
                      labelText: 'Nom du dernier tome'
                  )
              ),

              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: new RaisedButton(
                  child: new Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  onPressed: () => null,
                  color: Colors.deepPurple,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedBookType) {
    setState(() {
      _defaultBookTypes = selectedBookType;
    });
  }

}