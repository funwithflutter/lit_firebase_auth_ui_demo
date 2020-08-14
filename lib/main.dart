import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:lit_firebase_ui_demo/config/palette.dart';

import 'screens/home.dart';
import 'screens/unauthenticated/unauthenticated.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.muliTextTheme(),
          accentColor: Palette.darkOrange,
        ),
        home: const LitAuthState(
          authenticated: Home(),
          unauthenticated: Unauthenticated(),
        ),
      ),
    );
  }
}
