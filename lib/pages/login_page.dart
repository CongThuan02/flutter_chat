import 'package:flutter/material.dart';
import 'package:flutter_chat/pages/register_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/my_button.dart';
import '../components/my_textformfield.dart';
import '../service/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Future<void> login(BuildContext context) async {
      final auth = AuthService();
      try {
        await auth.singInWithEmailPassword(
            email: emailController.text, password: passwordController.text);
      } catch (e) {
        Fluttertoast.showToast(
            backgroundColor: Theme.of(context).colorScheme.background,
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 2,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          Center(
            child: Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          // welcome back message
          Text(
            "Welcome back, you've been missed!",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
          // email textfield
          MyTextFormfield(
            controller: emailController,
            hinText: 'Emial',
            hinPassword: false,
          ),
          //pw textfield
          MyTextFormfield(
            controller: passwordController,
            hinText: 'Password',
            hinPassword: true,
          ),
          // login button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyBytton(
              height: 50,
              width: MediaQuery.of(context).size.width,
              borderRadius: 10,
              textButton: 'Loggin',
              onPressed: () {
                login(context);
              },
            ),
          ),
          // register now
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Not a member?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Register now",
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
