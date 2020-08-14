import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Signed in'),
            RaisedButton(
              onPressed: () {
                context.signOut();
              },
              child: const Text('Sign out'),
            )
          ],
        ),
      ),
    );
  }
}
