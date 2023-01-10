import 'package:flutter/material.dart';

class UnderlinedRow extends StatelessWidget {
  final List<Widget> children;
  const UnderlinedRow({Key? key, this.children = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: children,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
        Divider(
          height: 2,
          thickness: 2,
          color: Color(0xFFF4F4F4),
        )
      ]),
    );
  }
}
