import 'package:flutter/material.dart';
import 'package:myapp/newPayees.dart';
import 'package:myapp/recipients.dart';

/// Flutter code sample for [TabController].

void main() => runApp(const TopNavigationBar());

class TopNavigationBar extends StatefulWidget {
  const TopNavigationBar({super.key});

  @override
  State<TopNavigationBar> createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabControllerExample(),
    );
  }
}

const List<Widget> tabs = <Widget>[
  Recipients(),
  NewPayees(),
];

class TabControllerExample extends StatelessWidget {
  const TabControllerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.people), text: 'Recipients'),
            Tab(icon: Icon(Icons.add), text: 'Add'),
              ],
            ),
          ),
          body: const TabBarView(
            children: tabs,
          ),
        );
      }),
    );
  }
}