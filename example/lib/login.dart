import 'package:flutter/material.dart';
import 'package:oneid_sdk_eg/home.dart';

class LoginWithOneID extends StatefulWidget {
  const LoginWithOneID({Key? key}) : super(key: key);

  @override
  State<LoginWithOneID> createState() => _LoginWithOneIDState();
}

class _LoginWithOneIDState extends State<LoginWithOneID> {
  OneIDPlugin? oneIdPlugin;

  @override
  void initState() {
    oneIdPlugin = const OneIDPlugin(apiKey: 'apiKey');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
          onTap: () async {
            var res = await oneIdPlugin!.oneId(context: context);
            await _navigateToHome(context: context, user: res);
          },
          child: const Text('login'),
        ),
      ),
    );
  }
}

Future<void> _navigateToHome({
  required BuildContext context,
  required User user,
}) async {
  await Navigator.push<void>(
    context,
    MaterialPageRoute(builder: (_) => Home(params: HomeParams(user: user))),
  );
}
