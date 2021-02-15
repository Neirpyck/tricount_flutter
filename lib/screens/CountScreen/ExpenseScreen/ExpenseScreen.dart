import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseScreen extends StatefulWidget {
  ExpenseScreen({Key key}) : super(key: key);

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  List<Map> participants = [
    {
      'name': 'Val',
      'cost': 1.45,
    },
    {
      'name': 'Cyp',
      'cost': 1.45,
    },
    {
      'name': 'Eren',
      'cost': 1.45,
    },
    {
      'name': 'Romain',
      'cost': 1.45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Make SliverAppBar
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Assouplissant', //TODO: Make variable
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      '€5.80', //TODO: Make variable
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Paid by Val', //TODO: Make variable
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '2/10/21', //TODO: Make variable
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ), //TODO: Make variable
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          FlatButton(
            textColor: Colors.white,
            onPressed: () {}, //TODO: Edit button
            child: Text("EDIT"),
          ),
        ],
      ),
      body: Column(
        children: [
          AddImage(),
          NumberParticipants(),
          ListParticipants(participants: participants),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  //TODO: Add logic if more than one Expense
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                  Text(
                    'PREVIOUS',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddImage extends StatelessWidget {
  const AddImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey[400],
          ),
        ),
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add_a_photo,
                color: Colors.grey,
              ),
              onPressed: () {}, //Add an image
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add an image',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class ListParticipants extends StatelessWidget {
  const ListParticipants({
    Key key,
    @required this.participants,
  }) : super(key: key);

  final List<Map> participants;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: participants.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${participants[index]['name']}'),
                  Text(
                      '${NumberFormat.currency(name: '€').format(participants[index]['cost'])}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NumberParticipants extends StatelessWidget {
  const NumberParticipants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.grey[400],
          ),
        ),
      ),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text('For 4 participants, including me'),
      ), //TODO: Make Variable
    );
  }
}
