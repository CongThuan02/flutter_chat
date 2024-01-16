import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../components/my_button.dart';
import '../components/my_textformfield.dart';
import '../service/auth/auth_service.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    Future<void> register(BuildContext context) async {
      var auth = AuthService();
      if (passwordController.text == "" ||
          emailController.text == "" ||
          confirmPasswordController.text == "") {
        showDialog(
            context: context,
            builder: (BuildContext context) => const AlertDialog(
                  content: Text("Username and password are required"),
                ));
      } else if (passwordController.text != confirmPasswordController.text) {
        showDialog(
          context: context,
          builder: (BuildContext context) => const AlertDialog(
            content: Text("Password and confirm password not match"),
          ),
        );
      } else {
        try {
          await auth.signUpWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
        } catch (e) {
          Fluttertoast.showToast(
              msg: "This is a Toast message",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              textColor: Colors.white,
              fontSize: 16.0);
        }
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
            "let's create an account for you",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 20,
            ),
          ),
          // email text-field
          MyTextFormfield(
            controller: emailController,
            hinText: 'Emial',
            hinPassword: false,
          ),
          //pw text-field
          MyTextFormfield(
            controller: passwordController,
            hinText: 'Password',
            hinPassword: true,
          ),
          //confirm password
          MyTextFormfield(
            controller: confirmPasswordController,
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
              textButton: 'Register',
              onPressed: () {
                register(context);
              },
            ),
          ),
          // register now
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account ?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login now",
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
