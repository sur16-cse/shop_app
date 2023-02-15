import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    const params = {
      'key': 'AIzaSyCMOXbOrdOeH1N8f4d8fVzPzEhRD7Psemk',
    };

    final authUri = Uri.https(
        'identitytoolkit.googleapis.com', '/v1/accounts:$urlSegment', params);
    print(authUri);
    final response = await http.post(
      authUri,
      body: json.encode(
        {
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
  return  _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
  return  _authenticate(email, password, "signInWithPassword");
  }
}