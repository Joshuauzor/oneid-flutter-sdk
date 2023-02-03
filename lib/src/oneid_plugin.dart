import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oneid_flutter/views/views.dart';

import 'data/models/models.dart';

class OneIDPlugin extends Equatable {
  final String apiKey;

  /// Initialize the OneID object. It should be called as early as possible
  /// (preferably in initState() of the Widget.
  ///
  /// [apiKey] - your OneID api key. This is mandatory
  ///
  ///
  const OneIDPlugin({required this.apiKey});

  @override
  List<Object> get props => [apiKey];

  String get getPublicKey {
    // Validate that the sdk has been initialized
    _performChecks();
    return apiKey;
  }

  void _performChecks() {
    //check for null value, and length and starts with pk_
    if (apiKey.isEmpty) {
      log('error occured - apiKey is empty');
    }
  }

  Future<User> oneId({
    required BuildContext context,
  }) async {
    /// check if initialization was successful
    _performChecks();

    /// return dialog
    return _showOneIdDialog(
      context: context,
      apiKey: apiKey,
    );
  }

  Future<User> _showOneIdDialog({
    required BuildContext context,
    required String apiKey,
  }) async {
    var res = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => OneIdWebView(
        params: OneIdWebViewParams(apiKey: apiKey),
      ),
    );
    return res;
  }
}
