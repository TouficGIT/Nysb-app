import 'package:flutter/material.dart';

class BdRoute extends StatefulWidget {
  @override
  BdRouteState createState() => new BdRouteState();
}


class BdRouteState extends State<BdRoute> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List _BdTypes = ["BD", "Comic book", "Graphic novel"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _defaultBdType;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _defaultBdType = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String BdType in _BdTypes) {
      items.add(new DropdownMenuItem(
          value: BdType,
          child: new Text(BdType)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Nouvelle série : Bande dessinée"),
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
                value: _defaultBdType,
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

  void changedDropDownItem(String selectedBdType) {
    setState(() {
      _defaultBdType = selectedBdType;
    });
  }

}