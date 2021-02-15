import 'package:flutter/material.dart';

import 'BalanceScreen/BalanceScren.dart';
import 'ExpenseList.dart';

class CountScreen extends StatefulWidget {
  @override
  _CountScreenState createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen>
    with SingleTickerProviderStateMixin {
  String name = 'Colloc';
  String participants = 'Cyp, Eren, Romain, Val';
  List<Map> expenses = [
    {
      'title': 'Assouplissant',
      'paidBy': 'Val',
      'cost': 5.80,
      'date': '10-02-2021',
    },
    {
      'title': 'Riz',
      'paidBy': 'Val',
      'cost': 23.30,
      'date': '10-02-2021',
    },
    {
      'title': 'Cyp diff',
      'paidBy': 'Val',
      'cost': 18.00,
      'date': '09-02-2021',
    },
    {
      'title': 'Crêpes',
      'paidBy': 'Romain',
      'cost': 20.00,
      'date': '08-02-2021',
    },
    {
      'title': 'Soirée',
      'paidBy': 'Romain',
      'cost': 36.00,
      'date': '02-02-2021',
    },
    {
      'title': 'Assouplissant',
      'paidBy': 'Val',
      'cost': 5.80,
      'date': '10-02-2021',
    },
    {
      'title': 'Riz',
      'paidBy': 'Val',
      'cost': 23.30,
      'date': '10-02-2021',
    },
    {
      'title': 'Cyp diff',
      'paidBy': 'Val',
      'cost': 18.00,
      'date': '09-02-2021',
    },
    {
      'title': 'Crêpes',
      'paidBy': 'Romain',
      'cost': 20.00,
      'date': '08-02-2021',
    },
    {
      'title': 'Soirée',
      'paidBy': 'Romain',
      'cost': 36.00,
      'date': '02-02-2021',
    },
    {
      'title': 'Assouplissant',
      'paidBy': 'Val',
      'cost': 5.80,
      'date': '10-02-2021',
    },
    {
      'title': 'Riz',
      'paidBy': 'Val',
      'cost': 23.30,
      'date': '10-02-2021',
    },
    {
      'title': 'Cyp diff',
      'paidBy': 'Val',
      'cost': 18.00,
      'date': '09-02-2021',
    },
    {
      'title': 'Crêpes',
      'paidBy': 'Romain',
      'cost': 20.00,
      'date': '08-02-2021',
    },
    {
      'title': 'Soirée',
      'paidBy': 'Romain',
      'cost': 36.00,
      'date': '02-02-2021',
    },
    {
      'title': 'Assouplissant',
      'paidBy': 'Val',
      'cost': 5.80,
      'date': '10-02-2021',
    },
    {
      'title': 'Riz',
      'paidBy': 'Val',
      'cost': 23.30,
      'date': '10-02-2021',
    },
    {
      'title': 'Cyp diff',
      'paidBy': 'Val',
      'cost': 18.00,
      'date': '09-02-2021',
    },
    {
      'title': 'Crêpes',
      'paidBy': 'Romain',
      'cost': 20.00,
      'date': '08-02-2021',
    },
    {
      'title': 'Soirée',
      'paidBy': 'Romain',
      'cost': 36.00,
      'date': '02-02-2021',
    },
  ];

  Icon firstIcon = Icon(Icons.more_vert);
  Icon secondIcon = Icon(Icons.share);
  Icon _icon;

  TabController _tabController;
  List<Tab> myTabs = <Tab>[
    Tab(
      icon: Icon(Icons.receipt),
      text: 'EXPENSES',
    ),
    Tab(
      icon: Icon(Icons.compare_arrows),
      text: 'BALANCES',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
    _tabController.addListener(() {
      setState(() {
        if (_icon == secondIcon) {
          _icon = firstIcon;
        } else {
          _icon = secondIcon;
        }
      });
    });
    _icon = firstIcon;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$name'),
            Text(
              '$participants',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ), //TODO: Make Variable

        actions: [
          IconButton(
            icon: _icon,
            onPressed: () {}, //TODO: CountSettingsMenu
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.yellow[700],
          tabs: myTabs,
          onTap: (int a) {},
        ),
      ),

      //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'createExpensePage');
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),

      //TODO: Hide on BalanceScreen
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: RichText(
                text: TextSpan(
                  text: 'MY TOTAL\n',
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: '€1,343.51', //TODO: Make Variable
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu),
              color: Colors.transparent,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Container(
                height: 40,
                child: Column(
                  children: [
                    Text(
                      'TOTAL EXPENSES',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '3,348.52', //TODO: Make Variable
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        color: Colors.black,
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          ExpenseList(items: expenses),
          BalanceScreen(), //TODO: BalancePage
        ],
      ),
    );
  }
}
