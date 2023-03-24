import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bx.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    toolbarHeight: 60,
    backgroundColor: Colors.black54,
    title: const Text(
      'BMI Calculator',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
    ),
    centerTitle: true,
    leading: const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Iconify(
        Bx.menu_alt_left,
        color: Colors.white,
        size: 20,
      ),
    ),
  );
}
