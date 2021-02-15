import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Map> items = [
    {
      'title': 'Colloc',
      'subtitle': 'la coloc des grosses bouffes',
    },
    {
      'title': 'Le voyage à Saint Malo',
      'subtitle': 'no description',
    },
    {
      'title': 'House on the lake',
      'subtitle': 'WAZAAAAAAA',
    },
    {
      'title': 'Lapland 12-16/03',
      'subtitle': 'no description',
    },
  ]; //TODO: Add DataBase

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tricount'),
        actions: [
          PopupMenuButton(
            onSelected: (selectedValue) {
              print(selectedValue);
            },
            itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('My settings'),
                      ),
                    ],
                  ),
                  value: '1'),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('Share the app'),
                      ),
                    ],
                  ),
                  value: '2'),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('Rate the app'),
                      ),
                    ],
                  ),
                  value: '3'),
              PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.contact_support,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text('Help'),
                      ),
                    ],
                  ),
                  value: '4'),
            ],
          ),
        ],
      ),

      //
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        overlayColor: Colors.black,
        backgroundColor: Colors.blue,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.notes,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            label: 'New tricount',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {}, //TODO: Add count
          ),
          SpeedDialChild(
            child: Icon(
              Icons.link,
              color: Colors.white,
            ),
            backgroundColor: Colors.blue,
            label: 'Join a tricount',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {}, //TODO: Join count
          ),
        ],
      ),

      //
      body: BodyList(items: items),
    );
  }
}

class BodyList extends StatelessWidget {
  const BodyList({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<Map> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'countPage');
                },
                onLongPress: () {}, //TODO: Delete count
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${items[index]['title']}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${items[index]['subtitle']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
