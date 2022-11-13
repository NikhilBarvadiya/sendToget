// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:sendtoget/Common/Utils/Utils.dart';
import 'package:sendtoget/Common/Widget/Custom.dart';
import 'package:sendtoget/Common/Widget/CustomRadioButton.dart';
import 'package:sendtoget/Ui/Screen/Home/ContactsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool _showFloatingIcon = true;

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  void _onFabLocationChanged(
    FloatingActionButtonLocation? value,
  ) {
    setState(() {
      _fabLocation = value ?? FloatingActionButtonLocation.endDocked;
      Navigator.of(context).pop();
    });
  }

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];
  static final List<FloatingActionButtonLocation> startLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.startDocked,
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          _showFloatingIcon
              ? GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text("Selecte Your Choice"),
                          actions: <Widget>[
                            CustomRadioButton<FloatingActionButtonLocation>(
                              value: FloatingActionButtonLocation.endDocked,
                              groupValue: _fabLocation,
                              title: const Text('Down Last'),
                              onChanged: _onFabLocationChanged,
                            ),
                            CustomRadioButton<FloatingActionButtonLocation>(
                              value: FloatingActionButtonLocation.centerDocked,
                              groupValue: _fabLocation,
                              title: const Text('Down Center'),
                              onChanged: _onFabLocationChanged,
                            ),
                            CustomRadioButton<FloatingActionButtonLocation>(
                              value: FloatingActionButtonLocation.startDocked,
                              groupValue: _fabLocation,
                              title: const Text('Down Start'),
                              onChanged: _onFabLocationChanged,
                            ),
                            CustomRadioButton<FloatingActionButtonLocation>(
                              value: FloatingActionButtonLocation.endFloat,
                              groupValue: _fabLocation,
                              title: const Text('Up End'),
                              onChanged: _onFabLocationChanged,
                            ),
                            CustomRadioButton<FloatingActionButtonLocation>(
                              value: FloatingActionButtonLocation.startFloat,
                              groupValue: _fabLocation,
                              title: const Text('Up Start'),
                              onChanged: _onFabLocationChanged,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Icon(Icons.more_vert),
                )
              : Container(),
          const SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'UserName',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SwitchListTile(
              activeColor: Colors.black,
              title: const Text(
                'On / Off',
              ),
              value: _showFloatingIcon,
              onChanged: (value) {
                setState(
                  () {
                    _showFloatingIcon = value;
                  },
                );
              },
            ),
            SizedBox(
              height: Utils.getHeight(context) * 0.6,
            ),
            CustomBotton(
              height: 50,
              text: "LOGOUT",
              function: () {
                Navigator.pushNamed(context, '/LoginScreen');
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIconTheme: const IconThemeData(color: Colors.black),
            selectedLabelTextStyle: const TextStyle(color: Colors.black),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.contacts_outlined),
                selectedIcon: Icon(Icons.contacts),
                label: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Contacts'),
                ),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.chat_outlined),
                selectedIcon: Icon(Icons.chat),
                label: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text('Chat'),
                ),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: SizedBox(
            height: 60,
            child: Row(
              children: <Widget>[
                const SizedBox(width: 10),
                if (startLocations.contains(_fabLocation)) const Spacer(),
                IconButton(
                  tooltip: 'Open navigation menu',
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () => _key.currentState!.openDrawer(),
                ),
                startLocations.contains(_fabLocation)
                    ? Container()
                    : centerLocations.contains(_fabLocation)
                        ? const Spacer()
                        : Container(),
                IconButton(
                  tooltip: 'Search',
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  tooltip: 'Favorite',
                  icon: const Icon(Icons.favorite, color: Colors.black),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _showFloatingIcon
          ? FloatingActionButton(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _fabLocation,
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    ContactsScreen(),
    Container(),
  ];
}
