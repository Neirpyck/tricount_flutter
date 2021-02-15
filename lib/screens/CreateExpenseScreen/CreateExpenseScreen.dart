import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Map> participants = [
  {
    'name': 'Val',
    'cost': 1.45,
    'isParticipating': true,
  },
  {
    'name': 'Cyp',
    'cost': 1.45,
    'isParticipating': true,
  },
  {
    'name': 'Eren',
    'cost': 1.45,
    'isParticipating': false,
  },
  {
    'name': 'Romain',
    'cost': 1.45,
    'isParticipating': true,
  },
];

class CreateExpenseScreen extends StatefulWidget {
  @override
  _CreateExpenseScreenState createState() => _CreateExpenseScreenState();
}

class _CreateExpenseScreenState extends State<CreateExpenseScreen> {
  String _typeExpense;
  String _paidBy;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('New expense'),
      ),
      body: Form(
        child: Column(
          children: [
            Container(
              height: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            maxLength: 50,
                            decoration: InputDecoration(
                              hintText: 'Title',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                value: _typeExpense,
                                underline: null,
                                hint: Text(
                                  'Expense',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.grey,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (value != null) {
                                      _typeExpense = value;
                                    }
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    child: Text(
                                      "For the group:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: null,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Expense",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    value: 'Expense',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Income",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    value: 'Income',
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Between members:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    value: null,
                                  ),
                                  DropdownMenuItem(
                                    child: Text(
                                      "Money transfer",
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    value: 'Money transfer',
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.local_offer,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                      onPressed: () {}, //Add an image
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                                  child: Container(
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
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {}, //Add an image
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Amount',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton(
                            style: TextStyle(
                              color: Colors.grey[900],
                            ),
                            value: 'EUR',
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey[900],
                            ),
                            items: [
                              DropdownMenuItem(
                                value: 'EUR',
                                child: Text(
                                  'EUR',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'More',
                                child: Text(
                                  'More',
                                  style: TextStyle(
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Expanded(
                      child: TextField(
                        onTap: () async {
                          var _picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2101),
                            firstDate: DateTime(2015, 8),
                          );
                          if (_picked != null)
                            setState(() {
                              _date = _picked;
                            });
                        },
                        enabled: true,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsetsDirectional.only(start: 30.0),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey[700],
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          hintText:
                              '${DateFormat.MMMd().format(_date)}, ${DateFormat.y().format(_date)}',
                          hintStyle: TextStyle(
                            color: Colors.grey[900],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Expanded(
                        child: DropdownButtonFormField(
                      value: _paidBy,
                      onChanged: (value) {
                        setState(() {
                          if (value != null) {
                            _paidBy = value['name'];
                          }
                        });
                      },
                      hint: Text(
                        '${participants[0]['name']}',
                        style: TextStyle(
                          color: Colors.grey[900],
                        ),
                      ),
                      items: participants.map<DropdownMenuItem<Map>>((dict) {
                        return DropdownMenuItem(
                          value: dict,
                          child: Text('${dict['name'].toString()}'),
                        );
                      }).toList(),
                    )),
                  ),
                ],
              ),
            ),
            ForWhom(),
            // ListParticipants(participants: participants),
            ListParticipants(),
          ],
        ),
      ), //TODO: Create Expense Form
    );
  }
}

class ForWhom extends StatefulWidget {
  const ForWhom({
    Key key,
  }) : super(key: key);

  @override
  _ForWhomState createState() => _ForWhomState();
}

class _ForWhomState extends State<ForWhom> {
  bool forWhom = true;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                child: Row(
              children: [
                Checkbox(
                  onChanged: (bool value) {
                    setState(() {
                      forWhom = value;
                    });
                  },
                  value: forWhom,
                ),
                Text('FOR WHOM'),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'ADVANCED', //TODO: Make Button
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ), //TODO: Make Variable
    );
  }
}

class ListParticipants extends StatefulWidget {
  ListParticipants({
    Key key,
  }) : super(key: key);

  @override
  _ListParticipantsState createState() => _ListParticipantsState();
}

class _ListParticipantsState extends State<ListParticipants> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 * participants.length.toDouble(),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Row(
                      children: [
                        CheckboxListTile(
                          onChanged: (bool value) {
                            setState(() {
                              participants[index]['isParticipating'] = value;
                            });
                          },
                          value: participants[index]['isParticipating'],
                        ),
                        Text('${participants[index]['name']}'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    '0.00 EUR',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ), //TODO: Make Variable
              ],
            ),
          );
        },
      ),
    );
  }
}
