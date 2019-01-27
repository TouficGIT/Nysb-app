import 'package:flutter/material.dart';
import 'package:nysb/route/mangaroute.dart';
import 'package:nysb/route/bdroute.dart';
import 'package:nysb/route/bookroute.dart';

class AddTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: Text('Manga'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MangaRoute()),
                );
              },
            ),

            new RaisedButton(
              child: Text('BD'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BdRoute()),
                );
              },
            ),

            new RaisedButton(
              child: Text('Livre'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookRoute()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

