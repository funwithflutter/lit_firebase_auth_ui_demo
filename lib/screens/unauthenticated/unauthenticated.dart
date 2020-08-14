import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:lit_firebase_ui_demo/screens/unauthenticated/widgets/register.dart';
import 'package:lit_firebase_ui_demo/screens/unauthenticated/widgets/sign_in.dart';

import 'widgets/background_painter.dart';

class Unauthenticated extends StatefulWidget {
  const Unauthenticated({Key key}) : super(key: key);

  @override
  _UnauthenticatedState createState() => _UnauthenticatedState();
}

class _UnauthenticatedState extends State<Unauthenticated>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);
  // bool showSignInPage = true;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LitAuth.custom(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackgroundPainter(
                  animation: _controller,
                ),
              ),
            ),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: ValueListenableBuilder<bool>(
                  valueListenable: showSignInPage,
                  builder: (context, value, child) {
                    return SizedBox.expand(
                      child: PageTransitionSwitcher(
                        reverse: !value,
                        duration: const Duration(milliseconds: 800),
                        transitionBuilder:
                            (child, animation, secondaryAnimation) {
                          return SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.vertical,
                            fillColor: Colors.transparent,
                            child: child,
                          );
                        },
                        child: value
                            ? SignIn(
                                key: const ValueKey('SignIn'),
                                onRegisterClicked: () {
                                  context.resetSignInForm();
                                  showSignInPage.value = false;
                                  _controller.forward();
                                },
                              )
                            : Register(
                                key: const ValueKey('Register'),
                                onSignInPressed: () {
                                  context.resetSignInForm();
                                  showSignInPage.value = true;
                                  _controller.reverse();
                                },
                              ),
                      ),
                      // AnimatedSwitcher(
                      //   duration: const Duration(milliseconds: 1000),
                      //   transitionBuilder: (child, animation) {
                      //     return FadeThroughTransition(
                      //       animation: animation,
                      //       secondaryAnimation: ReverseAnimation(animation),
                      //       fillColor: Colors.transparent,
                      //       child: child,
                      //     );
                      //     // return SlideTransition(
                      //     //   position: Tween<Offset>(
                      //     //           begin: Offset(0, 1), end: Offset(0, 0))
                      //     //       .animate(animation),
                      //     //   child: child,
                      //     // );
                      //   },
                      //   child: value
                      //       ? SignIn(
                      //           onRegisterClicked: () {
                      //             context.resetSignInForm();
                      //             showSignInPage.value = false;
                      //             _controller.forward();
                      //           },
                      //         )
                      //       : Register(
                      //           onSignInPressed: () {
                      //             context.resetSignInForm();
                      //             showSignInPage.value = true;
                      //             _controller.reverse();
                      //           },
                      //         ),
                      // ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class SignIn extends StatefulWidget {
//   const SignIn({Key key}) : super(key: key);

//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
//   AnimationController _controller;

//   @override
//   void initState() {
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 2));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) => SizedBox.expand(
//           child: CustomPaint(
//             painter: BackgroundPainter(
//               animation: _controller,
//             ),
//           ),
//         ),
//       ),
//       SizedBox.expand(child: SignInTemp(controller: _controller))
//     ]
//         // child:
//         //     SingleChildScrollView(child: SignInTemp(controller: _controller),),
//         // Center(
//         //   child: RaisedButton(
//         //     onPressed: () {
//         //       if (_controller.status == AnimationStatus.completed) {
//         //         _controller.reverse();
//         //       } else {
//         //         _controller.forward();
//         //       }
//         //     },
//         //     child: const Text('click'),
//         //   ),
//         // )
//         );
//   }
// }
