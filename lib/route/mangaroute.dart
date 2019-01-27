import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class MangaRoute extends StatefulWidget {
  @override
  MangaRouteState createState() => new MangaRouteState();
}


class MangaRouteState extends State<MangaRoute> {

  //*** Variables ***

    // Formulaire
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List _mangaTypes = ["Shonen", "Shojo", "Seinen", "Josei", "Kodomomuke"];
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _defaultMangaType;

    // JSON variables

  final mangaNameController = TextEditingController();
  final mangaTypeController = TextEditingController();
  final mangaVolController = TextEditingController();


  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _defaultMangaType = _dropDownMenuItems[0].value;
    super.initState();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/test.json');
  }

  Future<File> writeString(String str) async {
    final file = await _localFile;
    // Write the file
    return file.writeAsString('$str');
  }

  @override
  void test(String mangaName, String mangaType, String mangaVol) {
    var mangaInfos = {};
    mangaInfos["name"] = mangaName;
    mangaInfos["type"] = mangaType;
    mangaInfos["volume"] = mangaVol;
    String str = json.encode(mangaInfos);
    print(str);

    writeString(str);

  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String mangaType in _mangaTypes) {
      items.add(new DropdownMenuItem(
          value: mangaType,
          child: new Text(mangaType)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        title: Text("Nouvelle série : Manga"),
        backgroundColor: Colors.deepPurple,
      ),

      body: new Container (
        padding: const EdgeInsets.all(10.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[

              new TextField(
                decoration: new InputDecoration(labelText: 'Nom manga'),
                controller: mangaNameController,
              ),

              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
              ),

              new DropdownButton(
                value: _defaultMangaType,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),

              new TextField(
                decoration: new InputDecoration(labelText: "Dernier tome acheté"),
                keyboardType: TextInputType.number,
                controller: mangaVolController,
              ),

              new Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: new RaisedButton(
                  child: new Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  onPressed: () => test(mangaNameController.text, _defaultMangaType, mangaVolController.text),
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changedDropDownItem(String selectedMangaType) {
    setState(() {
      _defaultMangaType = selectedMangaType;
    });
  }

}