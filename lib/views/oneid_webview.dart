import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:oneid_flutter/oneid_flutter.dart';
import 'package:oneid_flutter/src/data/data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OneIdWebView extends StatefulWidget {
  const OneIdWebView({
    super.key,
    required this.params,
  });

  final OneIdWebViewParams params;

  @override
  State<OneIdWebView> createState() => _OneIdWebViewState();
}

class _OneIdWebViewState extends State<OneIdWebView> {
  late final WebViewController _controller;
  final uri = 'https://auth.oneidtech.com';

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;

    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            // check for navigation state change
            log(request.url);
            final uri = Uri.parse(request.url);

            if (uri.hasQuery) {
              final params = uri.queryParameters;
              if (params.containsKey('user')) {
                final user = json.decode(params['user']!);
                final response = User(
                  id: user['_id'],
                  username: user['fullName'],
                  oneId: user['oneId'],
                  email: user['email'],
                  isVerified: user['isVerified'],
                  fullName: user['fullName'],
                  gender: user['gender'],
                  dob: user['dob'],
                  phone: user['phone'],
                  maritalStatus: user['maritalStatus'],
                  primaryAddress: user['primaryAddress'],
                  secondaryAddress: user['secondaryAddress'],
                  country: user['country'],
                  postalCode: user['postalCode'],
                  token: params['token']!,
                );

                Navigator.pop(context, response);
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
        '$uri/auth?type=login&callback=$uri&api_key=${widget.params.apiKey}',
      ));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: WebViewWidget(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}

class OneIdWebViewParams {
  OneIdWebViewParams({
    required this.apiKey,
  });

  final String apiKey;
}
