import 'package:flutter/material.dart';
import 'package:myapp/topNavigationBar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PanelController panelController = PanelController();
  bool showSlidingWindow = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(children: [
            Container(
              alignment: Alignment.center,
              child: OutlinedButton.icon(
                onPressed: () {
                  // make show slidingWindow true
                  setState(() {
                    showSlidingWindow = !showSlidingWindow;
                  });
                },
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ),
            if (showSlidingWindow) _slidePanel(panelController),
          ]),
        ));
  }

  dynamic _slidePanel(PanelController panelController) {
    return SlidingUpPanel(
        backdropEnabled: true,
        controller: panelController,
        backdropOpacity: 0.5,
        backdropTapClosesPanel: true,
        minHeight: 50,
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        collapsed: Container(
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(10)),
          ),
          child: const Center(
            child: Text(
              "Recent Receipients",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        panelBuilder: (controller) => Center(
              child: TopNavigationBar(),
            ),
        body: Stack(children: <Widget>[
          GestureDetector(
            onTap: () {
              showSlidingWindow = false;
              setState(() {
                panelController.close();
              });
            },
          ),
        ]));
  }
}
