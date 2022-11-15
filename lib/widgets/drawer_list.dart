import 'package:flutter/material.dart';

import '../const/text_styles.dart';

class ListViewDrawer extends StatelessWidget {
  const ListViewDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'LTV coding challenge',
              textAlign: TextAlign.center,
              style: drawerTitle,
            ),
          ),
        ),
        ListTile(
          hoverColor: Colors.lightBlue,
          title: Text(
            'Articles',
            style: drawerOption,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/blog');
          },
        ),
        ListTile(
          title: Text(
            'Map',
            style: drawerOption,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/map');
          },
        ),
      ],
    );
  }
}
