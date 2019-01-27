import 'package:flutter/material.dart';
import 'package:nysb/tabs/list.dart';
import 'package:nysb/tabs/delete.dart';
import 'package:nysb/tabs/add.dart';
import 'package:nysb/tabs/account.dart';
import 'package:nysb/tabs/parameters.dart';

void main() {
  runApp(new Nysb());
}

class Nysb extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "NYSB",
      home: new Menu(),
      color: Colors.deepPurple,
    );
  }
}


class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NYSB'),
        backgroundColor: Colors.deepPurple,
      ),
      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          new ListTab(),
          new DeleteTab(),
          new AddTab(),
          new AccountTab(),
          new ParamsTab()
        ],

        // set the controller
        controller: controller,
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepPurple,
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              icon: new Icon(Icons.list),
            ),
            new Tab(
              icon: new Icon(Icons.delete),
            ),
            new Tab(
              icon: new Icon(Icons.add),
            ),
            new Tab(
              icon: new Icon(Icons.face),
            ),
            new Tab(
              icon: new Icon(Icons.build),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}