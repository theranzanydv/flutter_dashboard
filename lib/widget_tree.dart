import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'app_bar/app_bar_widget.dart';
import 'constants.dart';
import 'drawer/drawer_page.dart';
import 'panels/panel_center/panel_center_page.dart';
import 'panels/panel_left/panel_left_page.dart';
import 'panels/panel_right/panel_right_page.dart';
import 'responsive_layout.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  final List<Widget> _icons = [
    const Icon(Icons.home, size: 30),
    const Icon(Icons.list, size: 30),
    const Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 100),
          child: (ResponsiveLayout.isTinyLimit(context) ||
                  ResponsiveLayout.isTinyHeightLimit(context)
              ? Container()
              : const AppBarWidget()),
        ),
        body: ResponsiveLayout(
          tiny: Container(),
          phone: currentIndex == 0
              ? const PanelLeftPage()
              : currentIndex == 1
                  ? const PanelCenterPage()
                  : const PanelRightPage(),
          tablet: Row(
            children: const <Widget>[
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
            ],
          ),
          largeTablet: Row(
            children: const <Widget>[
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
              Expanded(child: PanelRightPage()),
            ],
          ),
          computer: Row(
            children: const <Widget>[
              Expanded(child: DrawerPage()),
              Expanded(child: PanelLeftPage()),
              Expanded(child: PanelCenterPage()),
              Expanded(child: PanelRightPage()),
            ],
          ),
        ),
        drawer: const DrawerPage(),
        bottomNavigationBar: ResponsiveLayout.isPhone(context)
            ? CurvedNavigationBar(
                index: currentIndex,
                backgroundColor: Constants.purpleDark,
                color: Colors.white,
                items: _icons,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )
            : const SizedBox(),
      ),
    );
  }
}
