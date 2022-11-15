import 'package:flutter/material.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
        onPressed: () => {Navigator.pushReplacementNamed(context, '/blog')},
        icon: const Icon(
          Icons.home_filled,
        ),
      ),
      IconButton(
        onPressed: () => {Navigator.pushReplacementNamed(context, '/map')},
        icon: const Icon(
          Icons.location_on_rounded,
        ),
      ),
    ]);
  }
}
