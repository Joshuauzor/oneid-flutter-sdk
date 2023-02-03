import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:oneid_flutter/oneid_flutter.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.params,
  });

  final HomeParams params;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('welcome ${widget.params.user.fullName}'),
      ),
    );
  }
}

class HomeParams {
  HomeParams({
    required this.user,
  });

  final User user;
}
