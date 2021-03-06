import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_github/ui/home/notification/notification.dart';
import 'package:flutter_github/ui/home/search/search.dart';
import 'package:flutter_github/ui/home/user/user.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static const List<Widget> _tabPages = <Widget>[
    SearchTabPage(),
    NotificationTabPage(),
    UserTabPage()
  ];

  _onTabClick(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Theme.of(context).platform == TargetPlatform.android
              ? Brightness.dark
              : Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _tabPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text('Notifications')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('User'))
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromARGB(255, 191, 191, 191),
        iconSize: 30.0,
        selectedFontSize: 16.0,
        unselectedFontSize: 14.0,
        onTap: _onTabClick,
      ),
    );
  }
}
