import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LoginPageView(),
    );
  }
}

class LoginPageView extends StatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height - kToolbarHeight-60.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(backgroundColor: Colors.indigo, radius: 100.0),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "UserName",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
            ),
            Container(
              child: TextField(

              ),
            ),
          ],
        ),
      ),
    );
  }
}
