import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          widget.scaffoldKey.currentState?.closeDrawer();
          context.push(appMenuItems[value].link);
        },
        selectedIndex: navDrawerIndex,
        children: [
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 30, 16, 10),
              child: Text("Main")),
          ...appMenuItems.sublist(0, 3).map(
                (e) => NavigationDrawerDestination(
                    icon: Icon(e.icon), label: Text(e.title)),
              ),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10), child: Divider()),
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Text("More options")),
          ...appMenuItems.sublist(3).map(
                (e) => NavigationDrawerDestination(
                    icon: Icon(e.icon), label: Text(e.title)),
              ),
        ]);
  }
}
