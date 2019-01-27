import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';


class ListTab extends StatefulWidget {
  @override
  ListTabState createState() => new ListTabState();
}

class ListTabState extends State<ListTab> {
  List data;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/test.json');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      String data = await file.readAsString();
      return data;
    } catch (e) {
      return 'error: empty file';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle
                .of(context)
                .loadString('$data'),
            builder: (context, snapshot) {
              // Decode the JSON
              var new_data = json.decode(snapshot.data.toString());

              return new ListView.builder(
                // Build the ListView
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    margin: EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 10.0,),
                    color: Color(0xFFa1d3f9),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new ListTile(
                          title: new Text(new_data[index]['name']),
                          subtitle: new Text(new_data[index]['address']),

                        )
                      ],
                    ),
                  );
                },
                itemCount: new_data == null ? 0 : new_data.length,
              );
            }
          ),
        ),
      ),
    );
  }
}




