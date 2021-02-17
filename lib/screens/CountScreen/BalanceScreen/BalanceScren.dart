import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({
    Key key,
  }) : super(key: key);

  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  static const String user = 'Val';
  List<Map> balance = [
    {
      'giver': 'Romain', // <=> paidBy
      'receiver': 'Val',
      'toPay': 1.45,
    },
    {
      'giver': 'Eren',
      'receiver': 'Romain',
      'toPay': 1.45,
    },
    {
      'giver': 'Val',
      'receiver': 'Cyp',
      'toPay': 1.45,
    },
  ];

  List<Map> participants = [
    {
      'name': 'Val',
      'toPay': 1.45,
    },
    {
      'name': 'Eren',
      'toPay': 1.45,
    },
    {
      'name': 'Romain',
      'toPay': 1.45,
    },
    {
      'name': 'Cyp',
      'toPay': 1.45,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          BalanceParticipant(participants: participants),
          Container(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'HOW SHOULD I BALANCE?',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.help_outline_outlined,
                      color: Colors.blue,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          ReimbursementCard(
            giver: '${balance[0]['giver']}',
            receiver: '${balance[0]['receiver']}',
            toPay: 33.48,
            user: user,
          ), //TODO: Make Variable
          Container(
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
              child: Text('OTHER REIMBURSEMENTS'),
            ), //TODO: Make Variable
          ),
          Container(
            height: 200 * balance.length.toDouble(),
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: balance.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReimbursementCard(
                    giver: '${balance[index]['giver']}',
                    receiver: '${balance[index]['receiver']}',
                    toPay: balance[index]['toPay'],
                    user: user,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ReimbursementCard extends StatefulWidget {
  ReimbursementCard({
    Key key,
    this.giver,
    this.receiver,
    this.toPay,
    this.user,
  }) : super(key: key);

  String giver;
  String receiver;
  String user;
  double toPay;
  @override
  _ReimbursementCardState createState() => _ReimbursementCardState();
}

class _ReimbursementCardState extends State<ReimbursementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 5),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width: 1,
                  color: Colors.grey[300],
                )),
            child: Column(
              children: [
                Expanded(
                    flex: 5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.user == widget.giver
                                    ? '${widget.giver} (me)'
                                    : '${widget.giver}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                ),
                              ),
                              Text('owes'),
                              Text(
                                '${widget.receiver}',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '€${widget.toPay}',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[800],
                            ),
                          ),
                        ), //TODO: Make Variable
                      ],
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border(
                              top: BorderSide(
                            width: 1,
                            color: Colors.grey[300],
                          ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('More options'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: widget.user == widget.giver
                                ? OutlineButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                          style: BorderStyle.solid),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'REIMBURSE',
                                          style: TextStyle(
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 0, 0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.blue,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                    onPressed: () {},
                                  )
                                : Container(),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BalanceParticipant extends StatelessWidget {
  const BalanceParticipant({
    Key key,
    @required this.participants,
  }) : super(key: key);

  final List<Map> participants;

  //TODO: Implement DataBase
  //TODO: Implement Graphiques
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
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${participants[index]['name']}'),
                  Text(
                      '${NumberFormat.currency(name: '€').format(participants[index]['toPay'])}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
