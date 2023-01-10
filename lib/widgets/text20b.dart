import 'package:flutter/material.dart';

class Text20b extends StatelessWidget {
  final String text;
  const Text20b(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 20),
    );
  }
}
